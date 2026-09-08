# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mgsub
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Safe, Multiple, Simultaneous String Substitution"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b641b7fe3bce793c8f4eda82ca653783')
b2sums=('5fed958e0426498a81f1f2826f15da537031203fc3006ef71950ea8366ed188217da5ffb011f2d34142277f888362a95bc4b0518db2f7df1db7bd14ab9750208')

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
