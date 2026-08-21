# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=writexl
_pkgver=2.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Export Data Frames to Excel 'xlsx' Format"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r
  zlib
)
optdepends=(
  r-bit64
  r-knitr
  r-nycflights13
  r-readxl
  r-rmarkdown
  r-spelling
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c8934267d0a5e6cba083ac48dd1b45b8')
b2sums=('72709fbab42629dd83ced081184b0538b76ab21b9f0343d99f05cc693ff859dbf39730430f01e562bfe449f0a6abd8c77c99ec5a00f213a5eb24db5e1a4e1c53')

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
