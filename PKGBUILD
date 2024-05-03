# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SARC
_pkgver=1.2.0
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
md5sums=('c9049814349b5f868bd9415d032e70b1')
b2sums=('4a53269c55e8015f353025591cfc1d096916898778376bdd1b6d125004c9bb40428d93bbd7ff14e5f9f45a3bd9f7e4499e4939a4f5ba38f0e3caad31b3a863e7')

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
