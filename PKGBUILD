# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=uniqtag
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Abbreviate Strings to Short, Unique Identifiers"
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
md5sums=('faea87762dd805d7aef056fdb84eaa24')
b2sums=('7c03e5db7d7ebaeed65f4afe399d5bb64c8d8270bbaf169218767d3a0d07ac31c7e37bfa1c7b7b748493a9c045bc8f3c22afbcd17ad4dfc1a6ddbcc2d4f0e7c6')

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
