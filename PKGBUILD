# Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=dsdcc
pkgver=1.8.2
pkgrel=1
pkgdesc="Digital Speech Decoder (DSD) rewritten as a C++ library"
arch=('any')
url="https://github.com/f4exb/dsdcc"
license=('GPL3')
depends=('mbelib' 'serialdv')
makedepends=('cmake')
provides=('dsdcc')
conflicts=('dsdcc')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('6fa4ea871180c98e96ea178a8fbd6fc5c9dc4caa9f521ff972b93b1d0ccacb81')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's|LIBSERIAL_NAMES|LIBSERIALDV_NAMES|g' cmake/Modules/FindSerialDV.cmake
}

build() {
  mkdir -p $srcdir/$pkgname-$pkgver/build
  cd $srcdir/$pkgname-$pkgver/build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBSERIALDV_INCLUDE_DIR=/usr/include/serialdv \
    -DUSE_MBELIB=ON

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}
