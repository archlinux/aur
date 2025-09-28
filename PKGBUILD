# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parallelDist
_pkgver=0.2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('5cfb8cd1b8f4b163680a6863a177e77b')
b2sums=('2af5d91b73bb137904a450be7446d48975c87816b255d5b9a7abf1f7c016eaeac0b35971bcfd1f4f5b49e2ee80fbd7d11dd9129e069ed1faac3f36c39725c2bc')

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
