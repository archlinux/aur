# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('kealib')
pkgver=1.4.11
pkgrel=1
pkgdesc="An HDF5 Based Raster File Format and its GDAL plugin"
arch=('i686' 'x86_64')
url='http://kealib.org'
license=('MIT')
makedepends=('cmake')
depends=('hdf5' 'gdal<2.4')
options=(!emptydirs)
source=("https://bitbucket.org/chchrsc/kealib/get/kealib-$pkgver.tar.bz2")
sha256sums=('c39aa8009e2504ed461e943974a1478ec2b96c0b04516d2386317c191ffce5aa')
_srcpath=chchrsc-kealib-74ca085025e9

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

package() {
  cd "$srcdir/$_srcpath"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
