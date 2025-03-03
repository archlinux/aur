# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rvinecopulib
_pkgver=0.7.1.1.2
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
md5sums=('01c5e35122a8895d1a8b4897fc645a80')
b2sums=('ddde349b6d418e5b4e44ba0db9ff5e2ad7f54e486f7d98c4cd87ef24eaaf263b2049306a13d368f98d47ee180ade5d131b0618b1646c711a6550e69ea89b84dd')

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
