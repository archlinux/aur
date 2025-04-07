# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=writexl
_pkgver=1.5.3
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
md5sums=('556eb03fe59680878b8adaecac769885')
b2sums=('ebc9ef4276dc4554d1602e90e26b9e6ff5d9aebd9348c0fbab472e3eb596da83158c7f59f86617c427a77b2a23f2cb7b33d89f7f36b34067916d47779f14fb34')

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
