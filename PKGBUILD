# Maintainer: snit <snit@cock.li>

_pkgname=pi-im
pkgname="${_pkgname}-wayland"
pkgver=3.14a
pkgrel=1
pkgdesc='Experimental and extremely weird XMPP client written in Go. No solicitors.'
url="https://github.com/sunglocto/${_pkgname}"
arch=('x86_64')
license=('AGPL')
makedepends=('go')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://github.com/sunglocto/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")

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
sha256sums=('dd2e319b948193b87c844bd314cfa6fbdef422ff4411b18a2dd5013522c2ffe0')
