# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=LinTInd
_pkgver=1.12.0
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
md5sums=('0dbcfccdd4c2b27967f34fd5f79406a5')
b2sums=('6ce2adf02471f2424a6ae5b3b952038b01490bbbe26938346b270866d5d06a678635a32d54e9c964265be2f8b796fc2c1da98a0a5a78a5f1b4ef426d872c70ca')

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
