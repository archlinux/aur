# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lsr
_pkgver=0.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Companion to \"Learning Statistics with R\""
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2497120c44990369d8a5a0452288c08a')
b2sums=('01c18ca1fd4f614b09b6e2b472e788dfb7276a71accf7d3302962accdbc6db84ae9d2a78b75ce414566d5e8e38427fedf2ad319cdf8ae3c5894ce41205c01e60')

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
