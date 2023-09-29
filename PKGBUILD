# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RcppInt64
_pkgver=0.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="'Rcpp'-Based Helper Functions to Pass 'Int64' and 'nanotime' Values Between 'R' and 'C++'"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-rcpp
)
checkdepends=(
  r-bit64
  r-nanotime
  r-tinytest
)
optdepends=(
  r-bit64
  r-nanotime
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('722715d7e9579f59b2d7ca4459f220b7')
sha256sums=('69bd4001de658e4edf8c1a297b7e9be5541778cd7e4b46c80b8929259fb62e37')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
