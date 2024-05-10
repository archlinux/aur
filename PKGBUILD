# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=nipalsMCIA
_pkgver=1.2.0
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
md5sums=('4092618c668e796e5fbaa4f6fe34bc2f')
b2sums=('331f310aa90a60f66efaf44d30118d37c038330e3c8bc23cabffeccb8768924f985bfd89ab0ff0aa6fb921c53136df7e9e8792d33b8a31bd6e40a51b5d6c6dcb')

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
