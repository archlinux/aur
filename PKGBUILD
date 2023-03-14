# Maintainer: Paul Wilde<paul@paulwilde.uk>
_pkgname=clonk-git
pkgname=${_pkgname}
pkgver=4c1eafa
pkgrel=1
pkgdesc="A simple X11 clock widget like xclock"
url="https://codeberg.org/pswilde/clonk.git"
arch=(any)
license=("AGPLv3")
depends=(
    xorg-server
)
sha256sums=('SKIP')
makedepends=(
    git
    make
    nim
    nimble
)
source=("${_pkgname%}::git+https://codeberg.org/pswilde/clonk")
conflicts=("${_pkgname}")
provides=(clonk)
pkgver() {
    cd "${_pkgname%}"
    printf "$(git rev-parse --short HEAD)"
}
build() {
    cd "${_pkgname%}"
    nimble build
}
package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/local/bin"
    install -Dm755 clonk -t "${pkgdir}/usr/local/bin"
    cd "${srcdir}"
}
