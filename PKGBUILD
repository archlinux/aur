# Maintainer: snit <snit@cock.li>

pkgname="pi-im"
pkgver=3.14a
pkgrel=1
pkgdesc='Experimental and extremely weird XMPP client written in Go. No solicitors.'
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
sha256sums=('dd2e319b948193b87c844bd314cfa6fbdef422ff4411b18a2dd5013522c2ffe0')
