# Maintainer: ugjka <esesmu@protonmail.com>

_pkgname=kwin-effect-grayscale
pkgname="$_pkgname-git"
pkgver=20180723.1786d3d
pkgrel=1
pkgdesc='KWin effect to turn the screen or window in grayscale color'
arch=('x86_64')
url="https://github.com/ugjka/${_pkgname}"
license=('GPL')
depends=(kwin)
makedepends=('extra-cmake-modules' 'git')
source=("$_pkgname"::"git+http://github.com/ugjka/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
    cd $_pkgname
    mkdir -p build
}

build(){
    cd $_pkgname
    cd build
    cmake .. \
        -DCMAKE_C_FLAGS:STRING="" \
        -DCMAKE_CXX_FLAGS:STRING="" \
        -DCMAKE_EXE_LINKER_FLAGS:STRING="" \
        -DCMAKE_SHARED_LINKER_FLAGS:STRING="" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package(){
    cd $_pkgname
    cd build
    make DESTDIR="$pkgdir" install
}
