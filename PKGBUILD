# Maintainer: snit <snit@cock.li>

_pkgname=pi-im
pkgname="${_pkgname}-wayland"
pkgver=3i
pkgrel=3.5
pkgdesc='the XMPP client from hell'
url="https://forge.sunglocto.net/sunglocto/${_pkgname}"
arch=('x86_64')
license=('AGPL')
makedepends=('go')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("https://forge.sunglocto.net/sunglocto/${_pkgname}/archive/${pkgver}.tar.gz")

prepare() {
    cd "${_pkgname}/"
    mkdir -p 'build/'
}

build() {
    cd "${_pkgname}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

    go build -tags wayland -o "${_pkgname}" .
}

package() {
    cd "${_pkgname}/"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
sha256sums=('c66ee58dd59fb61fd66ecda29683ebf29aa403c557c8bd81da142b9f57290f27')
