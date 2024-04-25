# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scrypt
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Key Derivation Functions for R Based on Scrypt"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-2-Clause')
depends=(
  r-rcpp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c3a4b02d972f92d056cdfe561c9a4b01')
b2sums=('d87a8e2938132edf0fafc35ee8331a17d69484e32175a0c0eb3bdab0f46250ac82142d66f71147eae8c62686796def7c6d08163944fa40396ca524f394cfb358')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -Dm644 "$_pkgname/LICENSE.note" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
