#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspFactor
_pkgver=0.17.2
pkgname=r-${_pkgname,,}
pkgver=0.17.2
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
sha256sums=('1b2eff21ec68541c4082e14cb1b5734be961e819a8e6b796539730e98a85ef39')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
