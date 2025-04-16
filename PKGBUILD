# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lfa
_pkgver=2.8.0
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
  r-corpcor
  r-rspectra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-bedmatrix
  r-genio
  r-ggplot2
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b51b91827560050db3455ecf54764e5b')
b2sums=('527784e4211dbd48236f915a0639d673f39fccf8ee46661c3bcf0e8538bf16bfa4aa059dfab1988454689ab3cacb64da57764d3049015bc76947f9d517f66b19')

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
