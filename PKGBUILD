# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>
pkgname=dynamic-wallpaper-importer
pkgver=1.0
pkgrel=1
pkgdesc="Dynamic wallpaper importer"
arch=(x86_64)
url="https://github.com/zzag/dynamic-wallpaper-importer"
license=('GPL')
depends=(libheif libplist qt5-base)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('904e863501fb573351a5b2401571a1fe7d2e36351d431820217675eede5a4181')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    make
}

package() {
    cd build
    make DESTDIR="$pkgdir" install
}
