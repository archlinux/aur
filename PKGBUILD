# Maintainer: snit <snit@cock.li>

pkgname="pi-im"
pkgver=3.142a
pkgrel=2
pkgdesc='the XMPP client from hell'
url="https://github.com/sunglocto/${pkgname}"
arch=('x86_64')
license=('AGPL')
makedepends=('go')

source=("https://github.com/sunglocto/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")

prepare() {
    cd "${pkgname}-${pkgver}/"
    mkdir -p 'build/'
}

build() {
    cd "${pkgname}-${pkgver}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

    go build -o "${pkgname}" .
}

package() {
    cd "${pkgname}-${pkgver}/"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
sha256sums=('57bfbbd804e4bc1a337b683d1baf7cb0878d39b28240e39a7fe6726c222df17f')
