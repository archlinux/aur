# Maintainer: Aditya Sirish <aditya@saky.in>

pkgname=witness
pkgver=0.1.12
pkgrel=1
pkgdesc="Witness is a pluggable framework for software supply chain risk management. It automates, normalizes, and verifies software artifact provenance."
arch=('any')
license=('Apache')
url="https://github.com/testifysec/witness"
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e02ee5cb340f9f703ea2204a4aed1d506c547979ca02155ad909968835ea5b19')

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "$pkgname-$pkgver"
    go build -o bin/${pkgname}
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 -t "${pkgdir}/usr/bin" bin/${pkgname}
}
