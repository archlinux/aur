# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scBubbletree
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantitative visual exploration of scRNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ape
  r-biocparallel
  r-dplyr
  r-ggplot2
  r-ggtree
  r-patchwork
  r-proxy
  r-reshape2
  r-scales
  r-seurat
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-singlecellexperiment
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4f1f5351a19a923ab9b5ba5e3ee73ed0')
b2sums=('884488b850d45d0af66459a06e4c60d587b93be49acb06673ea5fa93288c72090591ce43108a9eafd72d22bcd99df234aaf32c84260efdf68680ea4c8d0642e7')

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
