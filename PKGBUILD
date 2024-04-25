# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=stringmagic
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Character String Operations and Interpolation, Magic Edition"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
optdepends=(
  r-data.table
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('deaeb5f8c0d1beb10f15b64427c0eae9')
b2sums=('a5bdedec51103d0dbb131da4f27fbbba1c734c56eabe2a541360f0b5bc4119bcbe66dee676a87b38faa119baa04020cf5230995ec00a3b772dda55b06e29d216')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla stringmagic_tests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
