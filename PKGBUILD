# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=stringmagic
_pkgver=1.1.0
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
md5sums=('dc71f4f3d14034bf20fc380d32969c4c')
b2sums=('62b7944777aafb6e12929f8c036ce5a4faa164b3e942e3e593dd71b4efff7fc197baa96a0e98a8cae63dcd43cfbb73e2c422b6b1f6a8a64d8a5bbc043dff9eb6')

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
