# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gifsicle-git
pkgver=1.93.r0.g416518e
pkgrel=1
pkgdesc='Command-line tool for creating, editing, and getting information about GIF images and animations (git version)'
arch=('x86_64')
url='https://www.lcdf.org/gifsicle/'
license=('GPL2')
optdepends=('libx11: for gifview tool')
makedepends=('git' 'libx11')
provides=('gifsicle')
conflicts=('gifsicle')
source=('git+https://github.com/kohler/gifsicle.git')
sha256sums=('SKIP')

prepare() {
    autoreconf -fi gifsicle
}

pkgver() {
    git -C gifsicle describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd gifsicle
    ./configure --prefix='/usr'
    make
}

check() {
    gifsicle/test/testie -p gifsicle/src gifsicle/test
}

package() {
    make -C gifsicle DESTDIR="$pkgdir" install
}
