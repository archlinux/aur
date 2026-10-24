# Maintainer: Amos Ng <aur at amosng dot com>

pkgname=go-garble
pkgver=0.18.0
pkgrel=1
pkgdesc="Obfuscate Go builds"
arch=('x86_64')
url="https://github.com/burrowers/garble"
license=('BSD3')
makedepends=('go')
source=(garble-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
b2sums=('8c3380acf304a9386c4ae334fd8866d13216798f0d1ab1a134f4985e1e108f0f94608e953086bf11369b93f3950ad2e0b63bbf4414e2d07ac4cfca5c869ad65e')

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
