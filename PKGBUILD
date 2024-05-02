# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=omada
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Machine learning tools for automated transcriptome clustering analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-clvalid
  r-dicer
  r-dplyr
  r-fpc
  r-genieclust
  r-ggplot2
  r-glmnet
  r-kernlab
  r-pdfcluster
  r-rcpp
  r-reshape
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6f2b574eef1d352e074a064d77b6bf45')
b2sums=('37b754cf1ba17f21df3432e85f7dfa114c621b89b8e599194cf7f2c49a399c8c4e50713958eba571eba45e7ee1e53e0f2cbaa7dc155d9aeef89a79321150a50c')

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
