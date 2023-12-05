# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scBubbletree
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantitative visual exploration of scRNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('d64f38622d8aec6ebb23e81231710134')
sha256sums=('52ec5264b10e4b8df9e56a31f654adc102e99c66455fb9bbce4c3ab51ae79533')

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
