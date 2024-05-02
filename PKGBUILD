# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scBubbletree
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantitative visual exploration of scRNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ape
  r-future
  r-future.apply
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
md5sums=('a8b076ab9fdb2c157768bfceb2740946')
b2sums=('f2f041083f3954562a182bd73ad99eec0ed055009ca51b10421a3cce94919c4ebbfcc011ef0ec135d134852b3b1de29f26a09433b3eca6bb0beb4373baeebde7')

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
