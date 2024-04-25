# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sfarrow
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Read/Write Simple Feature Objects ('sf') with 'Apache' 'Arrow'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-arrow
  r-dplyr
  r-jsonlite
  r-sf
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a2e14236864928f98ae8c27590b7c3be')
b2sums=('4717ed27d5d345e1fd0dc403c8d4cfb7b7bff5f9d56086139766698c06d1b8d2442433bb3020d7ca18370f53fce114a690cbd3760f31d90f1ce37db723cf5f56')

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
