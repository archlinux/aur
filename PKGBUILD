# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scrypt
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Key Derivation Functions for R Based on Scrypt"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(BSD)
depends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c3a4b02d972f92d056cdfe561c9a4b01')
sha256sums=('014a233e33a505d677d72ab29c6193e74a660751073c43685f8f1615c0becc86')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -Dm644 "$_pkgname/LICENSE.note" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
