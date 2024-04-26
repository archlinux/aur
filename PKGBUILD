# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scBubbletree
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('d64f38622d8aec6ebb23e81231710134')
b2sums=('39791c5548c50b07fad86fd217d699bf03c69fb4721c99fd16cbf9e28247c4652c2a2da30e247897676820a3ab532c1b027a8fb02b86ff146583152b9610ec19')

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
