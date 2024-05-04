# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=crisprScoreData
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('5ae4856e689a5edd3d4c9449bca1985f')
b2sums=('ad6fb0c30905c5ba44b4b931af9a8e8b55e69d61d27061a55c74e276b036f288a8a8361e18ced4d56451c6b8c44d29f64475fcd688fb7aed8e6a6e49ed513a2c')

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
