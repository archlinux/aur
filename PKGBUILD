# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SARC
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Analysis of Regions with CNVs"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-data.table
  r-desctools
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-gtable
  r-iranges
  r-metap
  r-multtest
  r-plotly
  r-plyranges
  r-raggedexperiment
  r-rcolorbrewer
  r-reshape2
  r-scales
  r-tidyverse
)
checkdepends=(
  r-homo.sapiens
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
optdepends=(
  r-genomicalignments
  r-homo.sapiens
  r-kableextra
  r-knitr
  r-mus.musculus
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b3ccd1bbc820bc93c4b13ec4e3ec9705')
sha256sums=('5f032cedb91ca13f975da592479c83ff79c87c3ba5dd4472c1c7df0b9cec7a10')

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
