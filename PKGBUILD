# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=LinTInd
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Lineage tracing by indels"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-ape
  r-biocgenerics
  r-biostrings
  r-cowplot
  r-data.tree
  r-dplyr
  r-ggnewscale
  r-ggplot2
  r-ggtree
  r-iranges
  r-networkd3
  r-pheatmap
  r-purrr
  r-pwalign
  r-reshape2
  r-rlist
  r-s4vectors
  r-stringdist
  r-stringr
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('92c6b3c5b5aa628fbc0e66ebe3bee94e')
b2sums=('0f7bdd8845833297767e9e54fa21ffb0082b0098c5b53ce54a97e2cf0f20d58b7d69f02764cb1068b7ab0156c55e2753f44cf6be0c7cbcf2e74393083bf8d1d7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
