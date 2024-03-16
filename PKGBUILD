# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=alluvial
_pkgver=0.1-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=9
pkgdesc="Alluvial Diagrams"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-devtools
  r-dplyr
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7666ad9699dd92f470499b62a70c2c8a')
b2sums=('ab51abc1494d0b9c59fa6b85f01fd602912dea27bd62602f699359f8812695714b4ab4d15ef28abe01cc87e4ffed9c112e1ec490bbab46b373e3051ac446f735')

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
