# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=compSPOT
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tool for identifying and comparing significantly mutated genomic hotspots"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-data.table
  r-ggplot2
  r-ggpubr
  r-gridextra
  r-magrittr
  r-plotly
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a66384a7a2827f60e4dd871c4c5449f0')
b2sums=('3bbe0317d678cbd81c26d1d3f2fa6a11e9e6a0edfdb98a941f9d5ce3ab8e75d1b55f65e713b3e251e0c931d08e54872f8cb83a901cffa01757393ec1a36364be')

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
