# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=writexl
_pkgver=1.5.1
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
md5sums=('60ece27d9ad7f316ef242437678f9af8')
b2sums=('5ebd5eb6062a8a70b926346629e99b0ef3163751c7d42c4f125f5983032981351d126ea40bff26fd3bdb9955aa5ae36bc729b77553f8db3cb08bebf588317478')

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
