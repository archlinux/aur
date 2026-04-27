# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=safetensors
_pkgver=0.2.1
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
md5sums=('cd293a8236bf2abbf6bcf81dfc87ce65')
b2sums=('caf42a2e95c0b3c31f47be280c96217660c3472033de509f06bbd1ffeff8a9262adbe2945e7ea423a06d7ef0ab84831e6f98e0f692925fc85f63f4f28562a76e')

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
