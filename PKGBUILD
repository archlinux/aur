# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rprimer
_pkgver=1.10.0
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
md5sums=('644134f1fa3fa1f38156cbbae27ef3f4')
b2sums=('6c647b5343ada02523f99a07242af19f0c441998f3924dd3230b31745ae98471b53de96a4bcfc0494d35d3908f332b940071f3e3435695167e8a89bb16cbe2f5')

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
