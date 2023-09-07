#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspSem
_pkgver=0.18.0
pkgname=r-${_pkgname,,}
pkgver=0.18.0
pkgrel=1
pkgdesc="SEM Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-csem
  r-forcats
  r-ggplot2
  r-jaspbase
  r-jaspgraphs
  r-lavaan
  r-reshape2
  r-semplot
  r-semtools
  r-stringr
  r-tibble
  r-tidyr
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('d56499aef840c01ba02ed31bb1037004654eb727ce4cf15a809dd4628eab6503')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
