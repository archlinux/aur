# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proxyC
_pkgver=0.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Computes Proximity in Large Sparse Matrices"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  onetbb
  r-rcpp
)
makedepends=(
  r-rcpparmadillo
)
checkdepends=(
  r-entropy
  r-proxy
  r-testthat
)
optdepends=(
  r-entropy
  r-knitr
  r-proxy
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a86efb64490157a845b902900a724bea')
b2sums=('956bde1daac704b1a62edf86b4eb25b0014beacbf1a25f7ade06b92a465d345be06809577117ed7d169e609162fa2ace863cc282f5fb0bded2a1f738b7535414')

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
