# Maintainer: Nitin Bhat <nitinbhat972@gmail.com>
pkgname=cwal-git
_pkgname=cwal
pkgver=0.1.0
pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1
pkgdesc="A fast and lightweight command-line tool for generating dynamic color schemes from images (Git version)"
arch=('x86_64')
url="https://github.com/nitinbhat972/cwal"
license=('GPL3')
depends=('imagemagick' 'libimagequant')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${_pkgname}"
    git sparse-checkout init --no-cone
    git sparse-checkout set '*' '!assets/'
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake -B build
    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"
    DESTDIR="${pkgdir}" cmake --install build
}

