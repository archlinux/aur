# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='brotli-static'
_pkgname=${pkgname%-static}
pkgver=0.6.0
pkgrel=1
pkgdesc='Brotli compression library (static version)'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/google/brotli'
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/google/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('69cdbdf5709051dd086a2f020f5abf9e32519eafe0ad6be820c667c3a9c9ee0f')

build() {
    cd "$_pkgname-$pkgver"

    mkdir -p build
    cd build
    cmake .. \
        -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="/usr/lib"
    make
}

check() {
    cd "$_pkgname-$pkgver"
    make test
}

package() {
    cd "$_pkgname-$pkgver/build"
    install -d $pkgdir/usr/lib
    install -Dm755 *.a "$pkgdir/usr/lib/"
}
