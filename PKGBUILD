#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspFactor
_pkgver=0.17.3
pkgname=r-${_pkgname,,}
pkgver=0.17.3
pkgrel=1
pkgdesc="Factor Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-jaspsem
  r-lavaan
  r-psych
  r-qgraph
  r-reshape2
  r-semplot
  r-gparotation
  r-rcsdp
)
groups=(r-jasp r-jaspcommon)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('c84faebf6e98f1f659eaa327801fb94eef3fbab4855bb92b17e6a0c6d1f5d338')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
