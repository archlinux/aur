# Maintainer: laloch <lalochcz@gmail.com>

_pkgname=kwin-effect-osdclock
pkgname="$_pkgname-git"
pkgver=20190925.e1479a0
pkgrel=1
pkgdesc='KWin effect that displays clock at the corner of the screen'
arch=('x86_64')
url="https://github.com/laloch/${_pkgname}"
license=('GPL')
depends=('kwin')
makedepends=('extra-cmake-modules' 'git' 'pkgconf')
source=("$_pkgname"::"git+http://github.com/laloch/${_pkgname}.git")
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
        -DCMAKE_C_FLAGS:STRING="-Werror=deprecated-declarations" \
        -DCMAKE_CXX_FLAGS:STRING="-Werror=deprecated-declarations" \
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
