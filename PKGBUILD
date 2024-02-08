# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parallelDist
_pkgver=0.2.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Parallel Distance Matrix Computation using Multiple Threads"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  onetbb
  r-rcpp
  r-rcppparallel
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-dtw
  r-proxy
  r-rcppxptrutils
  r-testthat
)
optdepends=(
  r-dtw
  r-ggplot2
  r-proxy
  r-rcpparmadillo
  r-rcppxptrutils
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c825739a2da14d2c90b7a4064639fcbc')
b2sums=('b41497d7e4adcee2b40216f76f46921cb14999e6592a74edfb866741972569d8dfd0a55212de925899ee5591b0cc58ea757035f2e03c16100b7cca953b4dc570')

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
