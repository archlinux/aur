# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EmpiricalBrownsMethod
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('cde2165928019f9c13982d640a1303c5')
b2sums=('0aee514c5fad85792f9de62e9338c4a7df042d02b47ae95fa4a5a00d5b35935dc47891ec4fb47f0e86eaaef634aca7ed77bca4d1e5db85a83da61950ab782980')

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
