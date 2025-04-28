# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scMET
_pkgver=1.10.0
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
md5sums=('aa421166fb239e4fab2540a48782489c')
b2sums=('b6cf1e067c7bc094b6fcc1a3231209b5994156870c980202cb00a1cbacc527d795f68af1d13959ace439f966426cd05830db9efaba549e7bf926d2b882641972')

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
