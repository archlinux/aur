# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultiRNAflow
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for integrated analysis of temporal RNA-seq data with multiple biological conditions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-complexheatmap
  r-deseq2
  r-factoextra
  r-factominer
  r-ggalluvial
  r-ggplot2
  r-ggplotify
  r-ggrepel
  r-gprofiler2
  r-mfuzz
  r-plot3d
  r-plot3drgl
  r-reshape2
  r-s4vectors
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
md5sums=('223e9edd588edeb351f343daffb27bd3')
b2sums=('c582f6e4081d04c5c7558def452d5f7b6c274382f52131316cd2ecc73e692ecbf9983b12c8ed29c9b9f49c24a910130c3d62bb43d54518bf0cb344e4c79fdcca')

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
