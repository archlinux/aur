# Maintainer: M0Rf30
# Contributor: carlsagan12

pkgname=dakota
pkgver=6.6.0
pkgrel=2
pkgdesc="A flexible, extensible interface between analysis codes and
iterative systems analysis methods"
arch=(i686 x86_64)
url="https://dakota.sandia.gov/"
license=('LGPL')
depends=('boost' 'icu' 'lapack' 'tinyxml')
makedepends=('cmake' 'gcc-fortran' 'python2')
options=(!strip)
source=("https://dakota.sandia.gov/sites/default/files/distributions/public/$pkgname-6.6-public.src.tar.gz")

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

md5sums=('386393a680a94d7ca56468a6af9c9795')
