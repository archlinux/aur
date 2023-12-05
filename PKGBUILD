# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scMET
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bayesian modelling of cell-to-cell DNA methylation heterogeneity"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
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
md5sums=('6420a2af7464f67eb676f06d20f9d5a6')
sha256sums=('b4908e98a14b2a3ed26b52648a5ae025711676d8d06ad30a16bbfd0cc5007f2a')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
