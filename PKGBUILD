# Maintainer: snit <snit@cock.li>

_pkgname=pi-im
pkgname="${_pkgname}-wayland"
pkgver=3.142a
pkgrel=2
pkgdesc='the XMPP client from hell'
url="https://forge.sunglocto.net/sunglocto/${_pkgname}"
arch=('x86_64')
license=('AGPL')
makedepends=('go')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://forge.sunglocto.net/sunglocto/${_pkgname}/archive/${pkgver}.tar.gz")

prepare() {
    cd "${_pkgname}-${pkgver}/"
    mkdir -p 'build/'
}

build() {
    cd "${_pkgname}-${pkgver}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

    go build -tags wayland -o "${_pkgname}" .
}

package() {
    cd "${_pkgname}-${pkgver}/"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
sha256sums=('cd675bb3c4550d6d520129b456da1a7b6fcc60c40e5bf5e09f01a30027a00a7e')
