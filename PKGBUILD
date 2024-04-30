# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=stringmagic
_pkgver=1.1.2
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
md5sums=('0a2fcb182a7006b2cde153f1d1efccec')
b2sums=('4295a7cf6f1e4498eec0f4d1775847fbbaa50ff05cc40f1005d707bb392cffa71c1fe25f651f518d40cdfb6a80531362a01ee708a785d52ae427d0cd350f0a8d')

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
