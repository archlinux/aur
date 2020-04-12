# Maintainer: Amos (LFlare) Ng <me@amosng.com>

pkgname=garble
pkgver=0.7.2
pkgrel=1
pkgdesc="Obfuscate Go builds"
arch=('x86_64')
url="https://github.com/burrowers/garble"
license=('BSD3')
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('479cc0616bb5be4f98f05ede214424e582ec4b87c2e985a44ec657302498b0faf5c51870d94322f7dab1b5e584b3317a7f6cc7da4cbec4141bcd01c99e677c79')

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
