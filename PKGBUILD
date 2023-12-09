# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RcppInt64
_pkgver=0.0.4
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
md5sums=('19defdecd82e6d2b8a2aab49b24c8196')
sha256sums=('2c38cb2a4090a5c3ddd949893f357bd08068c2dc2272ecff1574b7f2b424cdbd')

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
