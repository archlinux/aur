# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=tmlshock
_pkgname=tmlshock
pkgver=1.3.0
pkgrel=3
pkgdesc='A terminal ttl clock and stopwatch build by golang'
arch=('x86_64')
url="https://github.com/yorukot/tmlshock"
license=('MIT')
provides=("${_pkgname}")
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('32eea2998a432a500cfb9a259387b9be3be0b078eccb417a701fd255e2d66b08')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "./bin/${_pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "bin/${_pkgname}" ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
