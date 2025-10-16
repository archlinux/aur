# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DALEX
_pkgver=2.5.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="moDel Agnostic Language for Exploration and eXplanation"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-ggplot2
  r-ibreakdown
  r-ingredients
  r-kernelshap
)
checkdepends=(
  r-caret
  r-gower
  r-kernlab
  r-parsnip
  r-randomforest
  r-ranger
  r-testthat
)
optdepends=(
  r-gower
  r-ranger
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('15d49c3caeac7d8307ed2f0873a44785')
b2sums=('dc499651b877e06d147d5d4e08008a421496dc50211577097f279d0e213a742b8360cf31e0331742df2c9dbeda00a08b4c4e8c93024cb3be8c12b79f685b36ab')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
