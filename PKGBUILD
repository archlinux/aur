# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=dsdcc
pkgver=1.7.7
pkgrel=1
pkgdesc="Digital Speech Decoder (DSD) rewritten as a C++ library"
arch=('any')
url="https://github.com/f4exb/dsdcc"
license=('GPL3')
depends=('mbelib' 'serialdv')
makedepends=('cmake')
provides=('dsdcc')
conflicts=('dsdcc')
source=("https://github.com/f4exb/dsdcc/archive/v$pkgver.tar.gz")
sha256sums=('c916cdf7b3e971bab7f9353453d5ca04635efe6d16ed6890d47fc1b80ee015a4')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's|LIBSERIAL_NAMES|LIBSERIALDV_NAMES|g' cmake/Modules/FindSerialDV.cmake
}

build() {
  cd $srcdir/$pkgname-$pkgver

  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBSERIALDV_INCLUDE_DIR=/usr/include/serialdv \
    -DUSE_MBELIB=ON

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
