# Maintainer: snit <snit@cock.li>

pkgname="pi-im"
pkgver=3.1i
pkgrel=1
pkgdesc='the XMPP client from hell'
url="https://forge.sunglocto.net/sunglocto/${pkgname}"
arch=('x86_64')
license=('AGPL')
makedepends=('go')

source=("https://forge.sunglocto.net/sunglocto/${pkgname}/archive/${pkgver}.tar.gz")

prepare() {
    cd "${pkgname}/"
    mkdir -p 'build/'
}

build() {
    cd "${pkgname}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

    go build -o "${pkgname}" .
}

package() {
    cd "${pkgname}/"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
sha256sums=('902a17cd6f46afb158164253392cf452f712528391f7e78b69d1991496868b02')
