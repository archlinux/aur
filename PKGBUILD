# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=hdf4
pkgver=2.11
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data."
arch=('i686' 'x86_64')
url="http://www.hdfgroup.org/hdf4.html"
license=('custom')
depends=('zlib' 'libjpeg-turbo')
makedepends=('gcc-libs' 'gcc-fortran' 'flex' 'bison')
conflicts=('netcdf')
source=(http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-4.2.11.tar.gz)
sha256sums=('c3f7753b2fb9b27d09eced4d2164605f111f270c9a60b37a578f7de02de86d24')

build() {
  cd $srcdir/hdf-4.2.11
  export CFLAGS=$CFLAGS" -fPIC"
  export LDFLAGS=" -l:libjpeg.so.8 "$LDFLAGS
  ./configure --prefix=/usr F77=gfortran 
  make
}
package() {
  cd $srcdir/hdf-4.2.11
  make prefix=$pkgdir/usr install
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mv $pkgdir/usr/examples $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/hdf-4.2.11/COPYING $pkgdir/usr/share/licenses/$pkgname
}
