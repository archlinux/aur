# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dreamlet
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Scalable differential expression analysis of single cell transcriptomics datasets with complex study designs"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ashr
  r-biocgenerics
  r-biocparallel
  r-broom
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-dplyr
  r-edger
  r-ggbeeswarm
  r-ggplot2
  r-ggrepel
  r-gseabase
  r-gtools
  r-iranges
  r-irlba
  r-limma
  r-lme4
  r-mashr
  r-matrixgenerics
  r-metafor
  r-purrr
  r-rcpp
  r-rdpack
  r-remacor
  r-reshape2
  r-rlang
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
md5sums=('c3e81ef429221ca65b0477fb6c354736')
b2sums=('10497482c85fadd6fd5f8f1529bcf028086ed572f14f3fba4b5f4e8f8bd57860451db36a03558ff6dcf879cc89cb7264ee50bc5ac2326994dcdcbb9256ad3249')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
