# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RJSONIO
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Serialize R Objects to JSON, JavaScript Object Notation"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f43a5bc14ece5584ebde01731845bc59')
b2sums=('f3121114d8d4a9d4cedb711995d5a1c5fa08155ad98a619418f63be41c6a55733bc7235ad6c299190882993c2445b1f5925b784faff85c68b680c3c7bd855321')

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
