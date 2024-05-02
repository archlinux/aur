# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=single
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Accurate consensus sequence from nanopore reads of a gene library"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocgenerics
  r-biostrings
  r-dplyr
  r-genomicalignments
  r-iranges
  r-reshape2
  r-rlang
  r-rsamtools
  r-stringr
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5a2ca2c6dea29eb383d01abb90f3a5c8')
b2sums=('3cf85a7370c9781431d89e08c06b126ed47447bb711a01078cbd76a4b7b6d2d55ebe4b17b1218d972209e8c1255efa8a61b09f7ba85fb5ee6a60eabfcebd73e5')

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
