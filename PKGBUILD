# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggvenn
_pkgver=0.1.19
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Draw Venn Diagram by 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-ggplot2
  r-rlang
  r-scales
)
optdepends=(
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ce9ca8c8f3143e09e3c43601b07051ec')
b2sums=('36ce5c417a1688d848fc706e041a11f9397efc05b696c49815a6f22e2185e22f5ff87a319a41151a62aaf2f55a0114283b68c53aaf22ddc4ae931ad7c72285b7')

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
