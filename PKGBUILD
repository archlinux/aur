# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=shades
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Simple Colour Manipulation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
optdepends=(
  r-covr
  r-ggplot2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('84eb1e60ab7bc6d1fbbd662840230951')
b2sums=('e82d7ad61b72098ce35916eb9d1b7c969b071d2c3f4da8349fb6a90c5e13fd30bd4dcbd4e71d6bfeb3611f332c3ea0f0e8500c42b25a530513b744f66d13d399')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname"
}
