# Maintainer: Yuval Hager <yhager at yhager dot com>

pkgname=intel-decimalfp
_pkgfile=IntelRDFPMathLib20U1
pkgver=2.0
pkgrel=1
pkgdesc='Software implementation of the IEEE 754-2008 Decimal Floating-Point Arithmetic specification'
arch=('i686' 'x86_64')
url='https://software.intel.com/en-us/articles/intel-decimal-floating-point-math-library'
license=('BSD')
makedepends=('make' 'gcc')
source=("https://software.intel.com/sites/default/files/m/d/4/1/d/8/${_pkgfile}.tar.gz")
sha1sums=('324a4ae8c220f760b354338dd5df49a8045182f7')

build() {
  cd ${srcdir}/${_pkgfile}/LIBRARY
  MAKEFLAGS="CC=cc CALL_BY_REF=0 GLOBAL_RND=1 \
             GLOBAL_FLAGS=1 UNCHANGED_BINARY_FLAGS=0"
  make -j$(nproc) ${MAKEFLAGS}
}

package() {
  install -D -t ${pkgdir}/usr/include ${srcdir}/${_pkgfile}/LIBRARY/src/*.h
  install -D ${srcdir}/${_pkgfile}/LIBRARY/libbid.a ${pkgdir}/usr/lib/libbid.a
}

# vim:set ts=2 sw=2 et:
