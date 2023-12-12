# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rprimer
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Design Degenerate Oligos from a Multiple DNA Sequence Alignment"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
sha256sums=('6326c6c1e9f2eec7725781d170151289802bdda4eb237372c480c46f546787c0')

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
