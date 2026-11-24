# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultiRNAflow
_pkgver=1.10.0
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
  r-rlang
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
md5sums=('283ae2a0dd14bbbde286b1d5dcd8ca8d')
b2sums=('f08b65718586ca95fce814c141d22970c84bebdee17ca2cfb2fdf32b9d6cffc5e797964d86564237eae7fece4e41ba0d521271a01ecfb5a402e0206518f81cdb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
