# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mmand
_pkgver=1.6.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mathematical Morphology in Any Number of Dimensions"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
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
md5sums=('9716940ae9f4a9e9ad3a8c4e889728a7')
sha256sums=('fc375da6b879fd1991880fd358ceeb762e61b3a1b02af9cff3a366d0811e74a1')

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
