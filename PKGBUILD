# Maintainer: envolution
# Contributor: Carlo Casta <carlo.casta at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=arpack++
_pkgname=arpackpp
pkgver=2.4.0
pkgrel=1
pkgdesc="an object-oriented version of the ARPACK package - updated fork"
arch=('any')
#url="http://www.ime.unicamp.br/~chico/arpack++/" - original
url="https://github.com/m-reuter/arpackpp"
license=('BSD-3-Clause')
depends=(
  'glibc'
  'arpack'
  'lapack'
  'blas'
)
optdepends=(
  'superlu: Supernodal sparse direct solver'
  'suitesparse: efficient sparse matrix ops via umfpack and cholmod'
)
options=(!strip)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/m-reuter/arpackpp/archive/refs/tags/${pkgver}.tar.gz"
)
md5sums=('50bffc44de364253f21c9bb6858e84cb')

package() {
  cd "${_pkgname}-${pkgver}"
  # install headers
  install -d ${pkgdir}/usr/include/arpack++
  install include/*.h ${pkgdir}/usr/include/arpack++

  # install docs
  install -d ${pkgdir}/usr/share/doc/arpack++
  install doc/* ${pkgdir}/usr/share/doc/arpack++

  # install examples
  install -d ${pkgdir}/usr/share/arpack++/examples
  cp -r examples/* ${pkgdir}/usr/share/arpack++/examples

  #install makefiles
  install -d ${pkgdir}/usr/share/arpack++/makefiles
  cp -r makefiles/* ${pkgdir}/usr/share/arpack++/makefiles
  install -Dm644 Makefile.inc ${pkgdir}/usr/share/arpack++/Makefile.inc

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGES.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGES.md"
}
# vim:set ts=2 sw=2 et:
