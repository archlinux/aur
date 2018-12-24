# Maintainer: robertfoster

pkgname=xash3d-hlsdk
pkgver=r321.59269b1
pkgrel=1
pkgdesc="Half-Life SDK from original Xash3D engine"
arch=('i686' 'x86_64')
url="http://xash.su/"
license=('GPL3')
makedepends=('make' 'binutils' 'cmake')
makedepends_i686=('gcc')
makedepends_x86_64=('gcc-multilib' 'lib32-gcc-libs')
source=("$pkgname::git+https://github.com/FWGS/hlsdk-xash3d")

pkgver() {
    cd $srcdir/$pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/$pkgname
    git submodule init && git submodule update
}

build() {
    cd $srcdir/$pkgname
        if [ -d build ]; then
               rm -rf build
        fi
	mkdir build
        cd build
        cmake ../ -DCMAKE_INSTALL_PREFIX="/usr/lib32"
        make

}

package() {
    cd $srcdir/$pkgname/
    cd build
    make DESTDIR=$pkgdir install
}

md5sums=('SKIP')
