# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=single
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('61242086622646ed92a4304d33bc1457')
b2sums=('50b11349ff3890069c228797f5834fae012375a44c4d5249de80159418361a43e8e4e51b3f685ddfd033c4ae91d4e39de668e58d10c85f78932d6258930a4925')

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
