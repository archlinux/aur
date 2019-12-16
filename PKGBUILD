# vim: ts=4 sts=4 sw=4 et ft=sh
# Maintainer: atriix <aur a snilius d com>

pkgname=go-jsonnet-git
_pkgname=go-jsonnet

pkgver=v0.14.0.r13.g0959f85
pkgrel=1
pkgdesc="Implementation of Jsonnet in pure Go"
url="https://github.com/google/go-jsonnet"
license=('Apache')
arch=('x86_64')
depends=('go>=1.11')
conflicts=('jsonnet')
provides=('jsonnet')

source=(git+https://github.com/google/go-jsonnet)
sha512sums=('SKIP')

build() {
    cd "${srcdir}/go-jsonnet"
    go build -v ./cmd/jsonnet
}

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -D -m755 "${srcdir}/go-jsonnet/jsonnet" "${pkgdir}/usr/bin/jsonnet"
}
