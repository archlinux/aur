# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Delaporte
_pkgver=9.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Functions for the Delaporte Distribution"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-covr
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a75d5bdc293b02503a3f54bb6db6d323')
b2sums=('f9bfc7e2a79d3c6cc646fd7a290fc94d8abc702a8e1335930e6f203b4323281ad4d1a253d145718d0e3ca42d89afedab1ba70066bdec3548a037625cfd276de5')

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
