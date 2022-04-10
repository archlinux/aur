#  Maintainer: Salvador Hernandez <salvah22 at gmail dot com>
# Contributor: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=pktools
downloadname=PKTOOLS
pkgver=2.6.7.6
pkgrel=1
pkgdesc="suite of utilities for image processing with a focus on remote sensing applications"
arch=('x86_64' 'i686')
url="http://pktools.nongnu.org"
license=('GPL3')
depends=('armadillo' 'gdal' 'gsl')
makedepends=('cmake')
source=(https://download-mirror.savannah.gnu.org/releases/pktools/$downloadname-$pkgver.tar.gz)
md5sums=('9ce79a225f3232fda91ef9df6ecd1f2b')

prepare() {
  if [ $pkgname != $downloadname ]
  then
    mkdir -p $srcdir/$downloadname-$pkgver/build
  else
    mkdir -p $srcdir/$pkgname-$pkgver/build
  fi
}

build() {
  if [ $pkgname != $downloadname ]
  then
    cd $srcdir/$downloadname-$pkgver/build
  else
    cd $srcdir/$pkgname-$pkgver/build
  fi
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DGSL_EXE_LINKER_FLAGS="" \
    ..
  make
}

package() {
  if [ $pkgname != $downloadname ]
  then
    cd $srcdir/$downloadname-$pkgver/build
  else
    cd $srcdir/$pkgname-$pkgver/build
  fi
  make DESTDIR=$pkgdir install
}
