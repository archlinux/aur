# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rvinecopulib
_pkgver=1.0.0.1.0
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
  r-knitr
  r-rmarkdown
  r-testthat
  r-univariateml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f2dfc10b30b8f7fd35b1c61b60d2e964')
b2sums=('a4be719be6d9c88ee6f1ec64eb83f32354b3b50111fcadfd6f0d605481c158333345e24a2eb80d327a84e4b1941e47e8c2a0ee4cabce9ca050838e7b3bdf1501')

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
