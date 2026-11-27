# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CoSIA
_pkgver=1.14.0
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
md5sums=('9bce0733bd808e7450ea79d1433416ea')
b2sums=('f3f87cecbd131aedf04c00976b0a629e20c3d0fdc2f544fe9258cc0a9a5412c9fe9aee6b5c836847ebc665097afad31c6ba736d68b73c496964e2295c15c8529')

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
