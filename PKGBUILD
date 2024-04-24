# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=safetensors
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('7fb57eff72a1e44950acb323bb51d14d')
b2sums=('900f17f1aaea93d482b2b07914bf2ca5c0c7b5e2ec4971b0edbf67ee0d618bf7fcd8edc6a2a27a32a73091ce59e8f96df03fe52b3ffc00b9030c30b3efa405e6')

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
