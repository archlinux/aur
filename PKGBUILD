# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rifiComparative
_pkgver=1.12.0
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
md5sums=('0e7f49ab0d3486dab544f684c3a1a30b')
b2sums=('bf317ed0187cfc17a810ff8285cacf4d42f37de3067c6bb7a2ac3e4e4b8f10d648e48f0694e25ab1821671ef45f6678ec524ee64f654322362439b17caf76f4c')

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
