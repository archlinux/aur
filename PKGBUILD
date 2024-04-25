# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mmand
_pkgver=1.6.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('9716940ae9f4a9e9ad3a8c4e889728a7')
b2sums=('6a98fa2b93bcd543aede6201e80ff2ff78145e5f8f9f20d7700bb5a8d56a4bbce6287fa2f41682ecd22739c39a064689211b34c84f38daf990a7d31f59d5dea2')

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
