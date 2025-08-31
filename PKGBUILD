# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DALEX
_pkgver=2.5.2
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
md5sums=('38587f3e8432848e5af64f1d14627848')
b2sums=('2bcf1059bbd1e290925d324dcb835b147a453d11a7365d960096b72623fe2bb3ef6d4d75531245cb9a77e8a29184436ef01d2f8e999a06ce1a95cd522747458d')

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
