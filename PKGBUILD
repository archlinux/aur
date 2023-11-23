# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dreamlet
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cohort-scale differential expression analysis of single cell data using linear (mixed) models"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-ashr
  r-biocgenerics
  r-biocparallel
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-dplyr
  r-edger
  r-ggplot2
  r-ggrepel
  r-gseabase
  r-gtools
  r-iranges
  r-limma
  r-lme4
  r-mashr
  r-matrixgenerics
  r-purrr
  r-rcpp
  r-rdpack
  r-reshape2
  r-s4vectors
  r-scattermore
  r-singlecellexperiment
  r-sparsematrixstats
  r-summarizedexperiment
  r-tidyr
  r-variancepartition
  r-zenith
)
makedepends=(
  r-beachmat
)
checkdepends=(
  r-muscat
  r-runit
)
optdepends=(
  r-biocstyle
  r-experimenthub
  r-knitr
  r-muscat
  r-pander
  r-rmarkdown
  r-runit
  r-scater
  r-scuttle
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('34ea1ec9e44c635699ed9cf8deed29cd')
sha256sums=('eefbfcf96915cdfc80f5a5b9eca92a6dd391d768eaa26feb1ef7cd873007ab0c')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
