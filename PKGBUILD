# Maintainer: Amos Ng <aur at amosng dot com>

pkgname=go-garble
pkgver=0.12.1
pkgrel=1
pkgdesc="Obfuscate Go builds"
arch=('x86_64')
url="https://github.com/burrowers/garble"
license=('BSD3')
makedepends=('go')
source=(garble-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('865047d7e09eb205322cc7c2a92e23733d71231217c18a47d1e39fb417bb3f7d75b2102d0b6ba0a157baf9f4f9edac2b1125caac40be8d50f537c71c379b00bf')

build() {
    cd garble-${pkgver}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build .
}

package() {
    cd garble-${pkgver}
    install -Dm755 garble ${pkgdir}/usr/bin/garble
}
