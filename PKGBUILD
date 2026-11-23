# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=immReferent
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="An Interface for Immune Receptor and HLA Gene Reference Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biostrings
  r-httr
  r-jsonlite
  r-rvest
  r-tibble
  r-yaml
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-knitr
  r-mockery
  r-rmarkdown
  r-spelling
  r-testthat
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('820a424ad9a822ab3ee7b0083f412c3b')
b2sums=('f5c4e59075d32b8bfd881fda3d46290c0458aa761691317ca423ad27d83af67bd4e6e6241dd67f14da1a10bd71e63265c5b8451109f9ffd06a490262e58b00ce')

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
