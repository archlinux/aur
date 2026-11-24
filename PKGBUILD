# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=MSstatsBioNet
_pkgver=1.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Network Analysis for MS-based Proteomics Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0 AND BSD-2-Clause')
depends=(
  r-htmlwidgets
  r-httr
  r-jsonlite
  r-msstats
  r-r2r
  r-rentrez
  r-stopwords
  r-text2vec
  r-tidyr
  r-xml2
)
optdepends=(
  r-biocstyle
  r-data.table
  r-knitr
  r-mockery
  r-msstatsconvert
  r-rmarkdown
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('178da22bd6d5aff119f8523c7deb1110')
b2sums=('e0e9ab7581716a455ee4dc362cf64a8e4f36da2d52899509e2662df777c13e5c1769273d44185f9ed92d97a3889621046bac2eda904200a25375fd0be81656a2')

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
