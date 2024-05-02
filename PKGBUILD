# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scMET
_pkgver=1.6.0
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
md5sums=('e7873f8dd3d34575f4d7f11c364fe1a4')
b2sums=('28a73e0718e73e8d19d4ba54aa830e0c06a3055e431ebd3df8c6f078995bea44d2d1da01e9227ce0ee6e1fdc278b11df9ac97b32187c0b60be72d067fb03fc79')

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
