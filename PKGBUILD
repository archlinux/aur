# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EmpiricalBrownsMethod
_pkgver=1.34.0
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
md5sums=('d1aa72408cdb1d64b5527f9dd93a6abe')
b2sums=('03a85bbff6132cbff44dacecedaa57080cf26b8c4e7d71a0977f56a1ee706c522ece8cde7f4c31d380be73ab74fefbce83af096fb30686c4ffc31e02a3222d53')

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
