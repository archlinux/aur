# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aws
_pkgver=2.5-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Adaptive Weights Smoothing"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-awsmethods
  r-gsl
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f422f58642bfe21fe004b38379fa455')
b2sums=('63f88ee2d0eb5c7f57ad04b5b009b4e617cf4eb5d0f40bdab7c376b6a5e993703006a2395fc887d99eb721c2b37503b727587ad704553d3eb1824da3979f87b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
