# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifiComparative
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'rifiComparative' compares the output of rifi from two different conditions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only AND MIT')
depends=(
  r-cowplot
  r-devtools
  r-domc
  r-dplyr
  r-dta
  r-egg
  r-foreach
  r-ggplot2
  r-ggrepel
  r-lsd
  r-reshape2
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-scales
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-writexl
)
optdepends=(
  r-biocstyle
  r-desctools
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5f76b5f9e57e55da53a99a5360140c62')
b2sums=('28ddb06abdce47d05d8a1e6b0f74f7c26c78c65be0c6eb008abb5097c160126ceb78cf4623306a47158c5113250d6392959497b0d96fbd6f2696fc5ce7d6e7cf')

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
