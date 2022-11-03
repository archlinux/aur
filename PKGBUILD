# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mfa
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Bayesian hierarchical mixture of factor analyzers for modelling genomic bifurcations'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biobase
  r-coda
  r-dplyr
  r-ggmcmc
  r-ggplot2
  r-magrittr
  r-mcmcglmm
  r-mcmcpack
  r-rcpp
  r-tibble
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c2cf74a948b389ee013a9ba1c90200e0cf461a055cc6440419956fff6da02f77')

prepare() {
  sed -i "s#PI#M_PI#" "${_pkgname}/src/gibbs.cpp"
  tar cfz "${_pkgname}.tar.gz" "${_pkgname}"
}

build() {
  #R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
  R CMD INSTALL ${_pkgname}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
