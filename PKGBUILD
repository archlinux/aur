# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nipalsMCIA
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multiple Co-Inertia Analysis via the NIPALS Method"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-complexheatmap
  r-dplyr
  r-fgsea
  r-ggplot2
  r-multiassayexperiment
  r-pracma
  r-rlang
  r-rspectra
  r-scales
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocfilecache
  r-biocstyle
  r-circlize
  r-ggpubr
  r-knitr
  r-piggyback
  r-reshape2
  r-rmarkdown
  r-seurat
  r-spatstat.explore
  r-stringr
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('188157c4292195321f1c4506fe50094d')
b2sums=('10b4d429c99e0eb00721008d8f132c951445961ad7441e1dad98f36ee292631fcf82ba69155198809f47c4bbaea0f539c0452007e148ae8bcce598c8c615470f')

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
