# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RcppInt64
_pkgver=0.0.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="'Rcpp'-Based Helper Functions to Pass 'Int64' and 'nanotime' Values Between 'R' and 'C++'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
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
b2sums=('48a65145a860ff6258177af24a92ad159b88cf86fc59c94a25147ff7a27a92d76409c41e4c807b507f8ae5a9a3dbc75a099278cf6dbb03ad8b70c4f9a8b2f802')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla tinytest.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
