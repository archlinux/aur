# Maintainer: Amos Ng <aur at amosng dot com>

pkgname=go-garble
pkgver=0.15.0
pkgrel=1
pkgdesc="Obfuscate Go builds"
arch=('x86_64')
url="https://github.com/burrowers/garble"
license=('BSD3')
makedepends=('go')
source=(garble-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('669e50227e62b9c37fec8f722b1efba8e13fa854ee577f65db1a8e8242cbc8fd445c39421270864e66f40eb19b2ae3c6ebcbf1025101a4f837f3db3e4c818867')

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
