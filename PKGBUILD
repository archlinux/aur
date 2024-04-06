# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proxyC
_pkgver=0.4.0
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
md5sums=('42557eb4e121b03858186d3cc7eea542')
b2sums=('451afa0b9b22431f63c0c357f0633b356b434846392c40a30c5d25ac1a7a73595725a66109ee2d29e896e5188ef8c2617d42836e81fad55c37c2f01d2d9a1de2')

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
