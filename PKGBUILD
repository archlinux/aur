# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=safetensors
_pkgver=0.2.0
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
md5sums=('a241b9a7bc117190966b0876fa482674')
b2sums=('b1caf22a1f8fbf49ed941eee4607237fc35ecc348a37d8a9d11e91549e3cfaef8429ff0f4aa33693346615c6a9471843ce7e1c8658f7e6d4002dbab5140adb8c')

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
