# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lfa
_pkgver=2.6.0
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
md5sums=('8cc986c57b3ea73343d7dba9e2e687ab')
b2sums=('18ff9f0c13f0d1a4d87aef6e5a6dd26286a5f48d762ea6da785dd75c41c0e6aac30db64c9af48f63f89abd9352d7c192456f905b80cff5ddecc52499e1f34ab6')

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
