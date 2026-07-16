# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scMET
_pkgver=1.14.0
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
md5sums=('c0cba7ed78dfcdf19f01e977014dba61')
b2sums=('49e8804fd24396de5bf3dc0833cdc70218d0036fd8bebd545dacf8227a3192036e1918791675ae86b1fc68a73681ab9f0402c0993881af1f332412ada6bea4ab')

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
