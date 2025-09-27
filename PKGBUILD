# Maintainer: kmille < aur | at | androidloves doT me >

pkgname=wormhole-william
pkgver=1.0.8
pkgrel=2
pkgdesc='A golang implementation of magic wormhole. It provides secure end-to-end encrypted file transfers between computers'
arch=('x86_64')
conflicts=('wormhole-william-bin')
url="https://github.com/psanford/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('42490f3c7e383d7d410e68a83fc18de1a5e9373934a9d71064e10948197759d1')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "${pkgname}" .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
