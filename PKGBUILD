# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RMTstat
_pkgver=0.3.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Distributions, Statistics and Tests Derived from Random Matrix Theory"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('71e2f2fd478902ab0135522b01d15e95')
b2sums=('99f1730060cecb5765cce8d3cccb8dca44669a06e447c07b2880cf70a3ec9ffd41d32d38ecb6d59462e71d914c924e814908eb2800411ca6636e15ce43c86b56')

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
