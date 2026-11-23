# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lfa
_pkgver=2.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Logistic Factor Analysis for Categorical Data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  blas
  lapack
  r-bedmatrix
  r-corpcor
  r-genio
  r-rspectra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d95bff87fd8980ecc864f135866608d2')
b2sums=('18ada1b9cdf07b95aaa77cd0a08686e10c688aa73262a4b32d859087877d0acb1fbf922b2e83ec1e24b1749c15e4f6adcae234b2b6d8704ccecb490f11243b54')

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
