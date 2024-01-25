# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifiComparative
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('d371dc0f2b156f4565b09b7cfa5406e0')
b2sums=('4b0d7fdd702f24739a603f19abb6407a89354589c9d58942ae07aef03e1a8e31cb0bf206aca26a0cbb47da2d1d4369ef3e6221efdc534b6803b9d5e3ab4ec03a')

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
