# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rvinecopulib
_pkgver=0.7.2.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="High Performance Algorithms for Vine Copula Modeling"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-kde1d
  r-rcpp
)
makedepends=(
  r-bh
  r-rcppeigen
  r-rcppthread
  r-wdm
)
checkdepends=(
  r-ggraph
  r-testthat
)
optdepends=(
  r-ggplot2
  r-ggraph
  r-igraph
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d3bb01c0cae3282e4442d1dab6024b5b')
b2sums=('29751ba5e93e8d25e4370366529a2c1e34cd8a8291e407aaaf52978301292f9cbc1c60f6d89d39fbbcdb55773a6fc5b55ee497f72febdeb3b8f17a4a0f5e3800')

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
