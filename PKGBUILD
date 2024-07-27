# Maintainer: Yuval Hager <yhager at yhager dot com>

pkgname=intel-decimalfp
_pkgfile=IntelRDFPMathLib20U3
pkgver=2.0.3
pkgrel=1
pkgdesc='Software implementation of the IEEE 754-2008 Decimal Floating-Point Arithmetic specification'
arch=('i686' 'x86_64')
url='https://software.intel.com/en-us/articles/intel-decimal-floating-point-math-library'
license=('BSD')
makedepends=('make' 'gcc')
source=("http://www.netlib.org/misc/intel/${_pkgfile}.tar.gz")
sha256sums=('13f6924b2ed71df9b137a7df98706a0dcc3b43c283a0e32f8b6eadca4305136a')

build() {
  cd ${srcdir}/LIBRARY
  MAKEFLAGS="CC=cc CALL_BY_REF=0 GLOBAL_RND=1 \
             GLOBAL_FLAGS=1 UNCHANGED_BINARY_FLAGS=0"
  make -j$(nproc) ${MAKEFLAGS}
}

package() {
  install -D -t ${pkgdir}/usr/include ${srcdir}/LIBRARY/src/*.h
  install -D ${srcdir}/LIBRARY/libbid.a ${pkgdir}/usr/lib/libbid.a
}

# vim:set ts=2 sw=2 et:
