# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=blaster
_pkgver=1.0.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Native R Implementation of an Efficient BLAST-Like Algorithm"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('80ecfcdc4cbd001e2db5f8a622b96eed')
b2sums=('ef2d139129061887c9a461c46c0d7211d08f54e59d8bb7e8d2a0bb361620839ffd51d99803bad72d791c58b2abc7270e7bdaa1d5a92cde66855079ad09f5b9e2')

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
