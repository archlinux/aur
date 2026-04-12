# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mmand
_pkgver=1.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mathematical Morphology in Any Number of Dimensions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-rcpp
)
checkdepends=(
  r-loder
  r-tinytest
)
optdepends=(
  r-covr
  r-loder
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1e43ee7150370a42964c34f665f5f6db')
b2sums=('3fa4ea597cfdc1af0a152741f1fb229082b876dd8f4b9d9cdb0e953679316ead157e68d4f755ed799ceb566a3d785fca44937b6a061dcfb8942cf1d44dd5d5a1')

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
