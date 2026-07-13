# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MNP
_pkgver=3.1-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fitting the Multinomial Probit Model"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  lapack
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5862777b79f5619529806483ed40286d')
b2sums=('f2d34472e640e5de0e8b61f75d5df10a55f31914daade17f05a426371552f1d7fcf470b66dbef061ffdbe8fdfe714c6ca6cd930542b8b7fb06fcf457a2f60df9')

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
