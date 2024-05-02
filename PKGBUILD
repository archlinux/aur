# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rprimer
_pkgver=1.8.0
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
md5sums=('c497fc1f0ef518894e2a96958d778853')
b2sums=('42357d993a121be0d9954535674df7bc94bef08b0847114848411537fcf5ac340e339b931c7eb1aa9548b7cf97c7f95afa93e7157530a3b56aa7d30f55c165c9')

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
