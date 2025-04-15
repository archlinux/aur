# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=writexl
_pkgver=1.5.4
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
md5sums=('390560fcbe9602fc6a3d8cc4c97291a9')
b2sums=('829a96fb366e10af53539aaa3742231b2993154b9740d4cd4973c95c4482ee35ac28cbd7e353007c15e066abd1671e82b21c23458c683231ae29a5e414afbb06')

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
