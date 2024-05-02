# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EmpiricalBrownsMethod
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Uses Brown's method to combine p-values from dependent tests"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f8933b206657e79e308f488b010e2c35')
b2sums=('0c9f2c11343eb89ba81465990a43194cb91a6904ce4b475eecae6b108b0e078cff8b3600d48eabaf7cce7eec2f2b93f7d8c4ebbb10da96c0092ee0ecb0adc9ab')

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
