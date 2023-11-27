# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gee
_pkgver=4.13-26
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Estimation Equation Solver"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  blas
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0dfe58c9fb7b6f6627d0b501eb3ba15e')
sha256sums=('9a8553b5ab51f3aa929ce80597b0b5cecd8a8bdb2ea3c578edd1c608c5c6438c')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
