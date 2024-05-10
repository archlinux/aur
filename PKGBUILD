# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=LinTInd
_pkgver=1.8.0
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
md5sums=('bd5c8c848408028ffc8fd1bd5529d586')
b2sums=('ea8db25d21644283bebf9bd52de15deb8bfaca0991abe5548b379730929e10c9b630c9a483acf82b56d0900816a191910a7fede32958dd936bf9e489ff9207d0')

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
