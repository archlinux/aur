#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspPredictiveAnalytics
_pkgver=0.19.0
pkgname=r-${_pkgname,,}
pkgver=0.19.0
pkgrel=1
pkgdesc="This module offers analyses for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL-2.0-or-later')
depends=(r
  r-jaspbase
  r-jaspgraphs
  r-bsts
  r-bssm
  r-precrec
  r-reshape2
  r-boom
  r-lubridate
  r-prophet
  r-bart
  r-ebmaforecast
  r-imputets
)
optdepends=(r-testthat)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('5a74771461ef6ebf86d037822789b79ccbce9b13fcca98e359b0bc75605e092b')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
