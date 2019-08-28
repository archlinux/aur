# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('kealib')
pkgver=1.4.12
pkgrel=1
pkgdesc="An HDF5 Based Raster File Format and its GDAL plugin"
arch=('i686' 'x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('cmake')
depends=('hdf5' 'gdal')
options=(!emptydirs)
source=("https://bitbucket.org/chchrsc/kealib/get/kealib-$pkgver.tar.bz2")
sha256sums=('844cdef518ab3fe3b6bae4bce5c1ca46e9ac9ff453b5ca5f3ccd87b23b89d511')
_srcpath=chchrsc-kealib-e042a597679f

build() {
  cd "$srcdir/$_srcpath"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_SKIP_RPATH=ON \
        -D CMAKE_CXX_STANDARD=11 \
        -D HDF5_INCLUDE_DIR=/usr/include \
        -D GDAL_INCLUDE_DIR=/usr/include \
        -D LIBKEA_WITH_GDAL=TRUE \
        .
  make
}

check() {
  cd "$srcdir/$_srcpath"
  make test
}

package() {
  cd "$srcdir/$_srcpath"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
