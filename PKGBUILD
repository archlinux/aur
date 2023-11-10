# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=retrofit
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="RETROFIT: Reference-free deconvolution of cell mixtures in spatial transcriptomics"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('ad2208835281053a2a9cdeeb9b19ab76ce27f86320a74bc65ebbfdd5c1915967')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
