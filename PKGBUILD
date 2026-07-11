# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=smd
_pkgver=0.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Compute Standardized Mean Differences"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-dplyr
  r-knitr
  r-markdown
  r-purrr
  r-rmarkdown
  r-stddiff
  r-tableone
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('221f236ee8eab5b2f177fdd653d7319a')
b2sums=('1a73d70a339dc52151027d4c7fee2662d992c9cfa7b39815345c7e1b0df9a04ab9b52231f88ca11aaade6b707caf710f929f61203631354357016b0aaf86cd75')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
