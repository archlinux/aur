# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rvinecopulib
_pkgver=0.7.1.1.1
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
md5sums=('27d0823cd6eb5c70f8f84aed45c6107e')
b2sums=('30534954f31efd39c2a88afede3ec44f8aaac32b0a158634b6db444890491859fc991c70000a5f4d751b132267dcb14967f79ec1177ea44d436edd857cf76528')

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
