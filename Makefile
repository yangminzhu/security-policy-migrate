
build:
	go build -ldflags="-s -w -X main.version=$(shell ./get-version.sh)" -o out/convert *.go

test:
	go test -v ./...

release: build test
	cd out && tar -czvf convert.tar.gz convert

clean:
	rm -fr ./out/

.PHONY: build test clean release
