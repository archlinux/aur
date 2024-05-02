# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=retrofit
_pkgver=1.4.0
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
md5sums=('c95b4ffd79d78ee34a28185190260da2')
b2sums=('0d1c5c97684854bc38ed452fc13dd1aeffaa2694f7745b10b0ce0121ab6b683b3cddedc3c66500bae75376013291c864f682d5bf669ad69c3f7f8dd948bd2f7b')

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
