#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspNetwork
_pkgver=0.17.1
pkgname=r-${_pkgname,,}
pkgver=0.17.1
pkgrel=1
pkgdesc="Network Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-bootnet
  r-bdgraph
  r-corpcor
  r-dplyr
  r-foreach
  r-ggplot2
  r-gtools
  r-huge
  r-isingsampler
  r-jaspbase
  r-jaspgraphs
  r-mvtnorm
  r-qgraph
  r-reshape2
  r-snow
  r-stringr
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('c06c20bdd001c9910874072689977afdc95eabe7583ae7a3896a60c08bd5ed71')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
