# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RcppInt64
_pkgver=0.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('bb09a98676afb93f4ccef916addb1f82')
b2sums=('e2b035c8581156952d8a28711041d43d1df02effc8ac49e4c2ba0cf295ddb4120dde021a8a58806bf2ed5d01fc74aecac55870c7bf5d427b27a8bed758d5fe81')

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
