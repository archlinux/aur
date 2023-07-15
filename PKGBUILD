# Maintainer: Amos Ng <aur at amosng dot com>

pkgname=go-garble
pkgver=0.10.1
pkgrel=1
pkgdesc="Obfuscate Go builds"
arch=('x86_64')
url="https://github.com/burrowers/garble"
license=('BSD3')
makedepends=('go')
source=(garble-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('72d7b5ff975b36e75e2ff7015130494efc71617ffa25086bac4f68d86a09f43ac19fd117cd237f4ed127fc906c728d429a11b8ea27d4065a67a2d8fe8c2acf71')

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
