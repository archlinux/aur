# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=retrofit
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('2b804a752a293f14495e94adb39df466')
b2sums=('1ee8008e567c755d0f173ae646ddd3cbae27ee1cb71b76c98ba59bb34908b383e1a51b4379e37c16e6fde107af4def387bcca7c1e75939e8aa95d3b8f3619a9f')

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
