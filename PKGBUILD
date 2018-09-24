# Maintainer: Gustavo Castro < gustawho [ at ] disroot [ dot ] org >

_gitname=shapecorners
pkgname=kwin-effect-shapecorners-git
pkgver=20180829.4c01369
pkgrel=1
pkgdesc='KWin effect to round corners of windows.'
arch=('any')
url="https://sourceforge.net/projects/shapecorners"
license=('GPL2')
depends=(kwin)
makedepends=('extra-cmake-modules' 'git')
source=("$_gitname"::"git+https://git.code.sf.net/p/${_gitname}/code")
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
    cd $_gitname
    mkdir -p build
}

build(){
    cd $_gitname
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package(){
    cd $_gitname
    cd build
    make DESTDIR="$pkgdir" install
}
