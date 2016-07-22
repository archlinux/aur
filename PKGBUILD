# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=hdf4
pkgver=2.12
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data."
arch=('i686' 'x86_64')
url="http://www.hdfgroup.org/hdf4.html"
license=('custom')
depends=('zlib' 'libjpeg-turbo')
makedepends=('gcc-libs' 'gcc-fortran' 'flex' 'bison')
conflicts=('netcdf')
source=(http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-4.2.12.tar.gz)
sha256sums=('dd419c55e85d1a0e13f3ea5ed35d00710033ccb16c85df088eb7925d486e040c')

build() {
  cd $srcdir/hdf-4.2.12
  export CFLAGS=$CFLAGS" -fPIC"
  export LDFLAGS=" -l:libjpeg.so.8 "$LDFLAGS
  ./configure --prefix=/usr F77=gfortran 
  make
}
package() {
  cd $srcdir/hdf-4.2.12
  make prefix=$pkgdir/usr install
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mv $pkgdir/usr/examples $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/hdf-4.2.12/COPYING $pkgdir/usr/share/licenses/$pkgname
}
