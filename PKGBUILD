# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=safetensors
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Safetensors File Format"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-jsonlite
  r-r6
  r-rlang
)
optdepends=(
  r-testthat
  r-torch
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('55430b9e839bc0c9d2eac062835a6c2c')
b2sums=('3196752cf7f8e93026d166ba2ebd27ef35129a3ae86b5e013e9ebbe6e9ef7bf625fa3aab31dc0835ed5046b0ac0a0925afd19d717c34ea3fe6f7db5295478c1a')

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
