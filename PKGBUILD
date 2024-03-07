# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=modules
_pkgver=0.13.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Self Contained Units of Source Code"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-devtools
  r-knitr
  r-lintr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3a07ad7260c200f44081628ead32ffbf')
b2sums=('4e24c748d09d500e46b6c9dfcb5bd21c71b20cf3158974c23d3204f63f596a6dd071e28d8b8a3ddea3ca70834adc13b93728afbb35b42b5d0b907a9c23d21f27')

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
