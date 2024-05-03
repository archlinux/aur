# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifiComparative
_pkgver=1.4.0
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
md5sums=('d3ce6a048c4757956cf1bc37d59b9c52')
b2sums=('7078862006a00414dbec65122cf1fa62b3755dff7d9d773e37cf6bb06049d46426833863d8c92428159de7dfd313914a106bf15c6b3e03e6622922248585ea84')

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
