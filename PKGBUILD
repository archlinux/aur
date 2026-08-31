# Maintainer: Nitin Bhat <nitinbhat972@gmail.com>

pkgname=cwal-git
_pkgname=cwal

pkgver=0.9.0.r32.g2b177d5
pkgrel=1
pkgdesc="Blazing-fast pywal-like color palette generator written in C."
arch=("x86_64")
url="https://github.com/nitinbhat972/cwal"
license=("GPL3")
depends=("imagemagick" "libimagequant" "luajit")
makedepends=("pkgconf")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=("SKIP")
options=("!strip" "!debug")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 |
        sed "s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
    cd "${srcdir}/${_pkgname}" || exit 1
    cc -o nob nob.c
    ./nob
}

package() {
    cd "${srcdir}/${_pkgname}" || exit 1
    DESTDIR="${pkgdir}" ./nob install
}
