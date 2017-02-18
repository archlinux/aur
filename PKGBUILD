# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>

pkgname=libcec3
_gitname=libcec
pkgver=3.1.0
pkgrel=1
pkgdesc="Pulse-Eight's libcec for the Pulse-Eight USB-CEC adapter"
arch=('i686' 'x86_64' 'armv7h')
url="http://libcec.pulse-eight.com/"
license=('GPL')
makedepends=('cmake')
depends=('udev' 'lockdev' 'libxrandr' 'p8-platform')
makedepends=('git' 'cmake')
source=("$_gitname::git+git://github.com/Pulse-Eight/$_gitname#tag=libcec-$pkgver")
sha256sums=('SKIP')

build() {
    cd "$_gitname"
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib
    make
}

package() {
    cd "$_gitname"
	cd build
    make DESTDIR="$pkgdir" install
	cd "$pkgdir"
    rm -rf usr/bin
    mv usr/include/libcec usr/include/libcec3
    rm -rf usr/lib/{pkgconfig,python3.5,libcec.so}
}

