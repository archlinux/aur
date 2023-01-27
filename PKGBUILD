#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspNetwork
_pkgver=0.17.0
pkgname=r-${_pkgname,,}
pkgver=0.17.0
pkgrel=4
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
makedepends=('git')
optdepends=()
source=("git+https://github.com/jasp-stats/${_pkgname}.git")
sha256sums=('SKIP')


build() {
  tar -cvf ${srcdir}/${_pkgname}_${_pkgver}.tar.gz ${_pkgname}
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
