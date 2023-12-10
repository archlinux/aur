# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=LinTInd
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Lineage tracing by indels"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('3dd8f8601ee8df3a0a53a02dc0c4d272')
sha256sums=('aaa51af68083825fd6dfc1e43442883a51eb80685b068bf41da166d403a2672e')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
