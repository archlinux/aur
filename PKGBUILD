# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=hdf4
pkgver=2.13
pkgrel=1
pkgdesc="General purpose library and file format for storing scientific data."
arch=('i686' 'x86_64')
url="http://www.hdfgroup.org/hdf4.html"
license=('custom')
depends=('zlib' 'libjpeg-turbo')
makedepends=('gcc-libs' 'gcc-fortran' 'flex' 'bison')
conflicts=('netcdf')
source=(http://www.hdfgroup.org/ftp/HDF/HDF_Current/src/hdf-4.2.13.tar.gz)
sha256sums=('be9813c1dc3712c2df977d4960e1f13f20f447dfa8c3ce53331d610c1f470483')

build() {
  cd $srcdir/hdf-4.2.13
  export CFLAGS=$CFLAGS" -fPIC"
  export LDFLAGS=" -l:libjpeg.so.8 "$LDFLAGS
  ./configure --prefix=/usr F77=gfortran 
  make
}
package() {
  cd $srcdir/hdf-4.2.13
  make prefix=$pkgdir/usr install
  mv $pkgdir/usr/share $pkgdir/usr/$pkgname
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mv $pkgdir/usr/$pkgname $pkgdir/usr/share/doc
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/hdf-4.2.13/COPYING $pkgdir/usr/share/licenses/$pkgname
}
