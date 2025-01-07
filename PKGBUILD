#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspPredictiveAnalytics
_pkgver=0.19.3
pkgname=r-${_pkgname,,}
pkgver=0.19.3
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
  r-scoringrules
  r-scoringutils
)
optdepends=(r-testthat)
groups=(r-jasp r-jaspextra)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('a89fee3ebd786a9d9e2194f360c1b2f8d9b58f60f1c773b4ffbe5df285aa4c48')

build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
