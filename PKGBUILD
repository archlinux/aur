# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CoSIA
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Investigation Across Different Species and Tissues"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-annotationtools
  r-biomart
  r-dplyr
  r-experimenthub
  r-ggplot2
  r-homologene
  r-magrittr
  r-org.ce.eg.db
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-plotly
  r-rcolorbrewer
  r-readr
  r-stringr
  r-tibble
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-biocstyle
  r-knitr
  r-qpdf
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6c89d29cf6c914bbfa6e14a09147ae46')
b2sums=('d9af75b2f1a3da33fcb9244984d5b5aa449b3e0b937b825e49be6d01a813b7ee8734546f9ec46033126f5c03dcdba551d7880652c351b83a87c726583a2e787d')

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
