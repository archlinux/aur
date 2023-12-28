# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Delaporte
_pkgver=8.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Statistical Functions for the Delaporte Distribution"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(BSD)
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
md5sums=('cc965f62f3d69e9c785e98890c9536db')
b2sums=('403e1862a517e5fc0d39b2066a54298cf4be5e63f9c6529f5ec3acb234930cecfe0e14376f32bb8d30a7f70eb540456a83659c06ae906365c2f20a72ccf2d9d4')

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
