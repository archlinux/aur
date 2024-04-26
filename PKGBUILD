# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rprimer
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Design Degenerate Oligos from a Multiple DNA Sequence Alignment"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biostrings
  r-bslib
  r-dt
  r-ggplot2
  r-iranges
  r-mathjaxr
  r-patchwork
  r-reshape2
  r-s4vectors
  r-shiny
  r-shinycssloaders
  r-shinyfeedback
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-kableextra
  r-knitr
  r-rmarkdown
  r-styler
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f866266895669cd0e898d1ffb0df86fa')
b2sums=('03b35c1db8ea384cda654714137c74da3ceeecc76b2ca5bb218d4da68203245348bc596e28bdca82070ba54125c96998d0ae50af7101ed9f082d5dabdeb87533')

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
