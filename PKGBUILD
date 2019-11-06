# Maintainer: Vlad Zahorodnii <vladzzag@gmail.com>
pkgname=dynamic-wallpaper-importer
pkgver=1.1
pkgrel=1
pkgdesc="Dynamic wallpaper importer"
arch=(x86_64)
url="https://github.com/zzag/dynamic-wallpaper-importer"
license=('GPL')
depends=(libheif libplist qt5-base)
makedepends=(cmake extra-cmake-modules)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/zzag/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f9d14ce182603040332a1740c49de7db6d306181dab9dcb47cc299ca2662bf63')

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
