# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=RProtoBuf
_pkgver=0.4.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R Interface to the 'Protocol Buffers' 'API' (Version 2 or 3)"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  abseil-cpp
  protobuf
  r-rcpp
)
checkdepends=(
  r-tinytest
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0ad2abe16bd6a7cd1c1499a398fb9cc1')
sha256sums=('a68bcab48efc8a22f7a44a1982d13b204afa29e9103f3cca12ade2824d9c5337')

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
