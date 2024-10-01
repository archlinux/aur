# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=dbarts
_pkgver=0.9-28
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Discrete Bayesian additive regression trees sampler"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-stats
  r-methods
  r-graphics
  r-parallel
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-testthat
  r-knittr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('69c558b6a95ad321d6549efe3b91ca0c')
b2sums=('c82bf0a657f3033f79f4cd9b88c189375e0adc8bf3b7c114b96173aae08c886a9e8ef830e6f82f1e7d5d394a3db38d452279e4c3e36ea81f332a8ea741f62b9a')

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
