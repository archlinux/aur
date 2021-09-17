# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=go-checksum
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple tool to calc Golang module checksum of go.mod and module dir"
arch=('x86_64')
license=('MIT')
url="https://github.com/vikyd/go-checksum"
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8f86aadaa07de76e760382d2080403c413539bbb6e5b4cc663a39243b8bfb276')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -o build/go-checksum
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 -t "${pkgdir}/usr/bin" build/go-checksum
}
