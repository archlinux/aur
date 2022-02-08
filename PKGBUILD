# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: dobedobedo <dobe0331 at gmail dot com>
pkgname=('kealib')
pkgver=1.4.14
pkgrel=1
pkgdesc="An HDF5 Based Raster File Format and its GDAL plugin"
arch=('i686' 'x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('cmake')
depends=('hdf5' 'gdal')
options=(!emptydirs)
source=("https://github.com/ubarsc/kealib/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('da5d4a540b34afb61665cb7b6bf284825b51464eaf2a23ccca16955e2712cab2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -D BUILD_SHARED_LIBS=ON \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX=/usr \
        -D GDAL_INCLUDE_DIR=/usr/include \
        -D GDAL_LIB_PATH=/usr/lib \
        -D HDF5_INCLUDE_DIR=/usr/include \
        -D HD5F_LIB_PATH=/usr/lib \
        -D HDF5_STATIC_LIBS=OFF \
        -D KEAHDF5_STATIC_LIBS=OFF \
        -D LIBKEA_HEADERS_DIR=../include \
        -D LIBKEA_LIB_PATH=../src \
        -D LIBKEA_WITH_GDAL=ON \
        .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
