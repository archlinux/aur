# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=MSstatsBioNet
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('56fdfe2f67ac352dd22d2cfbc606d9ec')
b2sums=('7540728edb42aabd445e58447781f3a6b133e8a10c25e67a4a87d94eba067aeb05abcedb157e6db19f66900182e97d14079fa5fe8a2c631b0b184a47597334e8')

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
