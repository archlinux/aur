# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mvabund
_pkgver=4.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Methods for Analysing Multivariate Abundance Data"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(LGPL)
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
sha256sums=('ed6946c95609443584081100cd38624d2309f7f5d210fd4b8ec12ad25bd27a06')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
