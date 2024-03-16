# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mgsub
_pkgver=1.7.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Safe, Multiple, Simultaneous String Substitution"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e204bdcd5b82c12f9cc0ebdd9bc3621')
b2sums=('f21476a3c30025f0c63270d041b78c4d891e009804cdbee674fbb6623065dd9c8d74069cce0997e6d355ce58361c732971a64f5c3c4e5b2024a368b722c98143')

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
