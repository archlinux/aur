# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scMET
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian modelling of cell-to-cell DNA methylation heterogeneity"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  onetbb
  r-assertthat
  r-biocstyle
  r-coda
  r-cowplot
  r-data.table
  r-dplyr
  r-ggplot2
  r-logitnorm
  r-matrixstats
  r-rcpp
  r-rcppparallel
  r-rstan
  r-rstantools
  r-s4vectors
  r-singlecellexperiment
  r-summarizedexperiment
  r-vgam
  r-viridis
)
makedepends=(
  r-bh
  r-rcppeigen
  r-stanheaders
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('454268faca57a0ade6352837704f5b15')
b2sums=('3595bacc055ef7f0b3f7d9df121996288e51a9d4803683e6f84db89fa2ef3a4004e78b24421488f076d84aad7019c9484f8b11af75ae1463948815eb0ecc1e8d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
