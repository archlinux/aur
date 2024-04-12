# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RegionalST
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Investigating regions of interest and performing cross-regional analysis with spatial transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-bayesspace
  r-colorspace
  r-dplyr
  r-fgsea
  r-ggplot2
  r-gridextra
  r-magrittr
  r-rcolorbrewer
  r-s4vectors
  r-scater
  r-seurat
  r-shiny
  r-singlecellexperiment
  r-summarizedexperiment
  r-tibble
  r-toast
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-gplots
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9589bef7f1408c77dee510baa14b4ad')
b2sums=('82d2fe4733e6bbfc397e0f52e30b13dafd96c5305ac67b8461ceb9edb86c3671d7924b05b441665a1b86c864ae8def6d0687773984f60731a0049132e3257749')

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
