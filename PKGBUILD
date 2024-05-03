# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=listviewer
_pkgver=4.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'htmlwidget' for Interactive Views of R Lists"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-htmltools
  r-htmlwidgets
  r-shiny
)
optdepends=(
  r-jsonlite
  r-miniui
  r-rstudioapi
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('07909f16effa110f98f803f137c61302')
b2sums=('6d00b4e0abcfc026eb76ee28fc47d05ad83b65d3362fa4d6dc81443a5ac8f2a561d6d95d0185b71965a4c867ffd9cbed79334ac6d54c034c0889363e91e0d273')

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
