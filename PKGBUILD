# Maintainer: Amos Ng <aur at amosng dot com>

pkgname=go-garble
pkgver=0.11.0
pkgrel=1
pkgdesc="Obfuscate Go builds"
arch=('x86_64')
url="https://github.com/burrowers/garble"
license=('BSD3')
makedepends=('go')
source=(garble-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('42e0537992c2d09d502df792683dca8d3ea0e038c30d14f55fb3c47c04c7817fcc78a6e0a55d6808f85fffb4d968bac4243c4bf222e90308984c4f6b448de878')

build() {
    cd garble-${pkgver}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build .
}

package() {
    cd garble-${pkgver}
    install -Dm755 garble ${pkgdir}/usr/bin/garble
}
