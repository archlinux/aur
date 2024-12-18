# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CoSIA
_pkgver=1.6.0
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
md5sums=('5c3d04805fd84a3b63480d1a47df2c97')
b2sums=('a4b8401eb15a6e41b99349c325a60360a18be9a819b13cfed056a40740b11975b056c5a3b9463cab6b7f15b0c7de7f2dd54efd90a81208260b4d1b3efd3865c2')

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
