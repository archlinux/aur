# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=molequeue
pkgver=0.8.0
pkgrel=1
pkgdesc="Desktop integration of high performance computing resources"
arch=(x86_64)
url="http://www.openchemistry.org/"
license=(custom)
depends=(qt5-base)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::"https://github.com/OpenChemistry/molequeue/archive/$pkgver.tar.gz"
        molequeue-gcc6.patch::"https://github.com/OpenChemistry/molequeue/commit/a983ff61.patch")
md5sums=('2f49f3e28965af6fec8a6df37d8ec697'
         'd57372453ba647ea741b0efb7e50dc50')

prepare() {
  mkdir -p build
# Fix GCC6 detection
  cd $pkgname-$pkgver
  patch -p1 -i ../molequeue-gcc6.patch
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
  install -Dm644 "$srcdir"/$pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
