# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=retrofit
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Reference-free deconvolution of cell mixtures in spatial transcriptomics"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rcpp
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-colorspace
  r-corrplot
  r-cowplot
  r-desctools
  r-ggplot2
  r-knitr
  r-pals
  r-png
  r-rcurl
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d3fb30a061a10552e92ee052157b4ca4')
b2sums=('220d23271476e5720ed07daa11c9df91a835caadf40055a5c0fdcf4a464a6acdc84808e1f8c2ca29c2fd85b9b6c6385c9cb3f404dbdacf7b4b78abd62edfffc7')

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
