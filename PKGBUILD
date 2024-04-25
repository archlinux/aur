# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mvabund
_pkgver=4.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Statistical Methods for Analysing Multivariate Abundance Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  gsl
  r-rcpp
  r-statmod
  r-tweedie
)
makedepends=(
  r-rcppgsl
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5ff7cf64b64e2d8ca4df9c3d198d3cf4')
b2sums=('ab7bd5a031fc6e83019990af229221f6662ec3a3b855b96d7a39594fd52a47949d95658472fab4ddbc86c016d3cdceb9755f0121456cd98a7adcc28a9a7514e7')

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
