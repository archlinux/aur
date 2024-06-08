# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=osqp
_pkgver=0.6.3.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quadratic Programming Solver using the 'OSQP' Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r-r6
  r-rcpp
)
makedepends=(
  cmake
)
checkdepends=(
  r-slam
  r-testthat
)
optdepends=(
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3c29c9fa31f72cd1326fe9da148ce02b')
b2sums=('2e90bd3a9caf39aa210aa5cad5b459d5c2267117b8e6e0784ab951033d2921f12adce44e2fdfb8903a3a8973de59a42da378c8cfb61cdff4645b648951668472')

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
