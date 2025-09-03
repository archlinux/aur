# Maintainer: Nitin Bhat <nitinbhat972@gmail.com>

pkgname=cwal-git
_pkgname=cwal

pkgver=latestcommit
pkgrel=1
pkgdesc="Blazing-fast pywal-like color palette generator written in C."
arch=('any')
url="https://github.com/nitinbhat972/cwal"
license=('GPL3')
depends=('imagemagick' 'libimagequant' 'lua')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
    cd "${srcdir}/${_pkgname}" || exit 1
    cmake -B build
    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}" || exit 1
    DESTDIR="${pkgdir}" cmake --install build
}
