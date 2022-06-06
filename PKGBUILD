# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CancerInSilico
_pkgver=2.16.0
pkgname=r-${_pkgname,,}
pkgver=2.16.0
pkgrel=2
pkgdesc='An R interface for computational modeling of tumor progression'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-rcpp
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
  r-rgl
  r-rmarkdown
  r-rtsne
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c0aaa86cdbf00da3a2e741d5946f6e9678840d577dafa9261dbd14d02f755cf7')

prepare() {
  # replace SIGSTKSZ with a constant number
  sed -i "s,SIGSTKSZ,8192,g" "${_pkgname}/src/Tests/catch.h"
  tar cfz "${_pkgname}.tar.gz" "${_pkgname}"
}

build() {
  # R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
