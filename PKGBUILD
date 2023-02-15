#Maintainer: sukanka <su975853527 AT gmail.com>
_pkgname=jaspBsts
_pkgver=0.17.1
pkgname=r-${_pkgname,,}
pkgver=0.17.1
pkgrel=1
pkgdesc="Bsts Module for JASP"
arch=('any')
url="https://github.com/jasp-stats/${_pkgname}"
license=('GPL')
depends=(r
  r-jaspbase
  r-jaspgraphs
  r-bsts
  r-boom
  r-ggplot2
  r-matrixstats
  r-reshape2
)
groups=(r-jasp r-jaspextra)
optdepends=(r-testthat)
source=("${_pkgname}_${_pkgver}.tar.gz::${url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('4c21a2ec3cb29d475103e2ee4f29e560f0326b7a9ea3786f81b4a44868c3d986')


build() {

  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  mkdir -p  ${pkgdir}/usr/lib/jasp-desktop/Modules
  ln -s /usr/lib/R/library ${pkgdir}/usr/lib/jasp-desktop/Modules/${_pkgname}
}
