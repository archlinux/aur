# Maintainer: snit <snit@cock.li>

pkgname="pi-im"
pkgver=3.1a_r
pkgrel=1
pkgdesc='Experimental and extremely weird XMPP client written in Go. No solicitors.'
url='https://github.com/sunglocto/${pkgname}'
arch=('x86_64')
license=('AGPL')
makedepends=('go')

source=("https://github.com/sunglocto/${pkgname}/archive/refs/tags/${pkgver//_/-}.tar.gz")
sha256sums=('e59ee05e0f2becc6f43c3397d75ed166c5523969eecda32b9b9ac774003faa66')

prepare() {
    cd "${pkgname}-${pkgver//_/-}/"
    mkdir -p 'build/'
}

build() {
    cd "${pkgname}-${pkgver//_/-}/"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'

    go build -o "${pkgname}" .
}

package() {
    cd "${pkgname}-${pkgver//_/-}/"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
