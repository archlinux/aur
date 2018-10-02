# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('kealib')
pkgver=1.4.10
pkgrel=1
pkgdesc="An HDF5 Based Raster File Format and its GDAL plugin"
arch=('i686' 'x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('hdf5-cpp-fortran' 'gdal' 'cmake')
depends=('hdf5-cpp-fortran' 'gdal')
options=(!emptydirs)
source=("https://bitbucket.org/chchrsc/kealib/downloads/kealib-$pkgver.tar.gz")
sha256sums=('b1bd2d6834d2fe09ba456fce77f7a9452b406dbe302f7ef1aabe924e45e6bb5e')
_srcpath=$pkgname-$pkgver

build() {
  cd "$srcdir/$_srcpath"
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_SKIP_RPATH=ON \
        -D CMAKE_CXX_STANDARD=17 \
        -D HDF5_INCLUDE_DIR=/usr/include \
        -D GDAL_INCLUDE_DIR=/usr/include \
        -D LIBKEA_WITH_GDAL=TRUE \
        .
  make
}

package() {
  cd "$srcdir/$_srcpath"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
