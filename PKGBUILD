# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simpleCache
_pkgver=0.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Simply Caching R Objects"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c06a53b3452831d7ae6ffdc415c6ed3')
b2sums=('dc60c0bab0556b69dcc772c56a4af9a139cc559694870f3b0d726f6584a5f566dd03f52a4cb287e11eef33cbba6034ff7cb334ed232d237acf5aec27e9eee77b')

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
