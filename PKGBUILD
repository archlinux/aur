# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Delaporte
_pkgver=8.4.0
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
md5sums=('b125551dc6e6e0b952e1928b141cf6a8')
b2sums=('e24619e3188135aa0a0d294a916574026966a464698b6bbe9377de3b402fce9436c8fa4a5368e181ed3edf4bca8d1f481068bc55495b1ab8f321b55ff31db285')

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
