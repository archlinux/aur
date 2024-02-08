# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proxyC
_pkgver=0.3.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Computes Proximity in Large Sparse Matrices"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  blas
  onetbb
  r-rcpp
  r-rcppparallel
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
md5sums=('e57fe4d1fd003337b06845fe6c8cd591')
b2sums=('c35d2ec7a6f506b0fb9f5ad3e0392289d147731a1f20d065ee9bde4cb8474e95854bc78be146cb64ba8b526eedc9cd2adbb44e6ef39b3523525736b80e95f901')

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
