# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rprimer
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('ef35d94051f88e635276ddcd43519f22')
b2sums=('7b5da7a98e9326eabd22959360c156d1b2186b5ead6bd21355b6b863c37a38e1ef56e393485e403027a36b93656b504841b22d36b57796ffaf14d7fc248e18e0')

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
