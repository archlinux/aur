# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: dobedobedo <dobe0331 at gmail dot com>
pkgname=('kealib')
pkgver=1.5.3
pkgrel=1
pkgdesc="An HDF5 Based Raster File Format and its GDAL plugin"
arch=('i686' 'x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('cmake')
depends=('hdf5' 'gdal')
options=(!emptydirs)
_github=https://github.com/ubarsc/kealib
source=("$_github/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('32b2e3c90553a03cf1e8d03781c3710500ca919bca674bc370e86f15338ee93e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D GDAL_INCLUDE_DIR=/usr/include \
        -D HDF5_INCLUDE_DIR=/usr/include \
        -D LIBKEA_WITH_GDAL=ON \
        .
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
