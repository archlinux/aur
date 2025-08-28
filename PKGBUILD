# Maintainer: snit <snit@cock.li>

pkgname="pi-im"
pkgver=3.142a
pkgrel=3
pkgdesc='the XMPP client from hell'
url="https://forge.sunglocto.net/sunglocto/${pkgname}"
arch=('x86_64')
license=('AGPL')
makedepends=('go')

source=("https://forge.sunglocto.net/sunglocto/${pkgname}/archive/${pkgver}.tar.gz")

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
sha256sums=('cd675bb3c4550d6d520129b456da1a7b6fcc60c40e5bf5e09f01a30027a00a7e')
