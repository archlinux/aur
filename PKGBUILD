# Maintainer: Amos (LFlare) Ng <me@amosng.com>

pkgname=garble
pkgver=0.8.0
pkgrel=1
pkgdesc="Obfuscate Go builds"
arch=('x86_64')
url="https://github.com/burrowers/garble"
license=('BSD3')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('ede48c2eb1a0ba8884cd4ab0d45a47a3865dafed2b958c8829dcce5f71670007287670f5466f328efdf45c64426a7e4511a4009c384661c1f6d921b061c9169f')

build() {
    cd ${pkgname}-${pkgver}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build .
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm755 garble ${pkgdir}/usr/bin/garble
}
