# Maintainer: M0Rf30

pkgname=dakota
pkgver=6.5.0
pkgrel=1
pkgdesc="A flexible, extensible interface between analysis codes and iterative systems analysis methods"
arch=(i686 x86_64)
url="https://dakota.sandia.gov/"
license=('LGPL')
depends=('boost' 'icu' 'lapack')
makedepends=('cmake' 'gcc-fortran' 'python2')
options=(!strip)
source=("https://dakota.sandia.gov/sites/default/files/distributions/public/$pkgname-6.5-public.src.tar.gz")

build() {
  cd "$srcdir/$pkgname-${pkgver}.src"
  mkdir build
  cd build
  cmake .. -Wno-dev -DPYTHON_EXECUTABLE=/usr/bin/python2 \
		    -DCMAKE_INSTALL_PREFIX=/usr \
		    -DDAKOTA_F90=OFF
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver}.src"
  cd build
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/include/{cblas.h,tinystr.h,tinyxml.h}
  rm $pkgdir/usr/lib/libtinyxml.so
  rm -rf $pkgdir/usr/examples
}

md5sums=('02c46e904d40bba6b308065db34c1ad7')
