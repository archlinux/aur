# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MultiRNAflow
_pkgver=1.12.0
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
md5sums=('10fe27f4aa2f8b9da8068983bee74749')
b2sums=('8484820386bd85268790b91e718045a4e7890d0cc35c154236d7a445bb40cba55943aa33aabf4f665acb98066036ce1b18c60d1e43f13203b29ea4d4c785a542')

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
