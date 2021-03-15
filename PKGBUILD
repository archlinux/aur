# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='brotli-static'
_pkgname=${pkgname%-static}
pkgver=1.0.9
pkgrel=1
pkgdesc='Brotli compression library (static version)'
arch=('x86_64')
license=('MIT')
url='https://github.com/google/brotli'
depends=('gcc-libs')
makedepends=('cmake')
options=('staticlibs')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/google/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f9e8d81d0405ba66d181529af42a3354f838c939095ff99930da6aa9cdf6fe46')

build() {
    cmake -B build -S "$_pkgname-$pkgver" \
        -DBUILD_SHARED_LIBS=OFF \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="/usr/lib"
    make -C build
}

check() {
    make -C build test
}

package() {
    cd build
    install -d $pkgdir/usr/lib
    install -Dm755 *.a "$pkgdir/usr/lib/"
}
