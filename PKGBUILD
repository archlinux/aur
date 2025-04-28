# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CoSIA
_pkgver=1.8.0
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
md5sums=('1ddbcf333aa7a37831af6342889bd09a')
b2sums=('091208f0355bd9b5a86656fb616a264dcfa33ce0866d553bea9a5ded2ad735365d7c1b8ec1827fe536d57a38decd7978a8b13356ea4a1f1ea58bd985f69458f1')

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
