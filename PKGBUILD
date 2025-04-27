# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SARC
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Analysis of Regions with CNVs"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
md5sums=('ab25e05af52b105482358ff4d61462bb')
b2sums=('8239f17b43adbd9ece9121282482b566d2c9ed73c8e99c2da2d66585b8e4c3864491eb9dc8af52631a02b2e81fa5174f481b4ffb349a7e6513e77a17449f071b')

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
