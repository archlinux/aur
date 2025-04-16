# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EmpiricalBrownsMethod
_pkgver=1.36.0
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
md5sums=('409d8642ff2987675ffff146f2b512bf')
b2sums=('8f11bb806962c92103c84e3209451ecc5c59606a3e1081d3367fc5d5b1cba51bd86202bf9781eaca253e8b4d4a22521f1f11940a4b8c77aab43ed06baeee6fc2')

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
