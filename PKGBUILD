# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=pktools
pkgver=2.6.7
pkgrel=1
pkgdesc="suite of utilities for image processing with a focus on remote sensing applications"
arch=('x86_64' 'i686')
url="http://pktools.nongnu.org"
license=('GPL3')
depends=('armadillo' 'gdal' 'gsl')
makedepends=('cmake')
source=(http://download.savannah.gnu.org/releases/pktools/pktools-$pkgver.tar.gz)
md5sums=('15c3e8fb5bc92b1205e99a958daf5eec')

prepare() {
  mkdir -p $srcdir/$pkgname-$pkgver/build
}

build() {
  cd $srcdir/$pkgname-$pkgver/build

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGSL_EXE_LINKER_FLAGS="" \
    -DBUILD_SHARED_LIBS=ON \
    ..

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/build

  make DESTDIR=$pkgdir install
}
