# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CoSIA
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Investigation Across Different Species and Tissues"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('3f8ef5bd89e113c1bf68ce002bd54140')
sha256sums=('303452b7fa963d3a46e9344beb02dcf7ddb3650d3e45f547580e50496ac102c3')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
