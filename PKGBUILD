# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=writexl
_pkgver=1.5.0
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
  r-nycflights13
  r-readxl
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('17dacf647864aed0b745bdd174601b4c')
b2sums=('7cde22f854c7b511ca660f4578bef7e787842eb77f0ae4d4558abd150a47186bcf1bc43cfe6a3cc70d7b12c6676c91fa79fd8fcd9e8fba0f726e6ecc679edbe4')

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
