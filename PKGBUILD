# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crisprScoreData
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Pre-trained models for the crisprScore package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationhub
  r-experimenthub
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1f4d86404f045ec36cf7d1b1c64373fe')
b2sums=('c88bf94f3d3442f04729ffaed0ee084a2b6f7a9501c9f2b43cd9ac0b2a0aa9142da8438da387a54293817b017eaeab96f1af00b90a92ca9e4922817ab5c98c81')

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
