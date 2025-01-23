# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rvinecopulib
_pkgver=0.7.1.1.0
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
md5sums=('6d30861a0c5641e66c221b9e46894e8b')
b2sums=('78a6a47f7bef14c6775d505f1f5d895a824717cb70f8958967b89f832ac200abdf90fcc73c58c67ceb8a0cfe477492adf54a5673b5545703a030441440f19327')

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
