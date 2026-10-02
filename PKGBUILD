# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=float
_pkgver=0.3-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="32-Bit Floats"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  blas
  lapack
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('81282b5f1880c7bc484ae44c9218267d')
b2sums=('4b36a193726d6a276dbc1bbe91d035f86acc2191651b61afc7a4fbcdfbe10cf07f963fd2e951bbe3ff02aec0825fde664a9d78a6daed49215604edd6d4e0bcc9')

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
