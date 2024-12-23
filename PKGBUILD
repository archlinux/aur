#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspSem
_pkgver=0.19.2
pkgname=r-${_pkgname,,}
pkgver=0.19.2
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
  r-semsens
)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('45651e13d8e7b66f465044bc7b96b22a7413c2224e76e0c162acf6faf10d2bb3')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
