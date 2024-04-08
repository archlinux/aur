# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=akima
_pkgver=0.6-3.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Interpolation of Irregularly and Regularly Spaced Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LicenseRef-scancode-acm-sla')
depends=(
  r-sp
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('55d36a85ecb1c2f82d22bdcec6f9ee3e')
b2sums=('688c8d0319290f16379c526fae9a2b7ee7cd69704dae0a4b8f1387f14d92780f2d3c657d0d1fac3fc3239ae58ba183b1a8a5d522c23c85c88c15452acb9af8c0')

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
