# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultiRNAflow
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for analysing RNA-seq raw counts with several biological conditions and different time points"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biobase
  r-complexheatmap
  r-deseq2
  r-factoextra
  r-factominer
  r-ggalluvial
  r-ggplot2
  r-ggrepel
  r-ggsci
  r-gprofiler2
  r-mfuzz
  r-plot3d
  r-plot3drgl
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-s4vectors
  r-scales
  r-summarizedexperiment
  r-upsetr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-e1071
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cefc109896f4cb34b4ee6a09ae966f42')
sha256sums=('5e7e81f1e25b61abd3f2cdee0e39527ccd0b92a2029b3d88a148d905478378ed')

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
