# Maintainer: snit <snit@cock.li>

pkgname="pi-im"
pkgver=3i
pkgrel=5
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
sha256sums=('c66ee58dd59fb61fd66ecda29683ebf29aa403c557c8bd81da142b9f57290f27')
