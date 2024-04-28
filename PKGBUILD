# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SARC
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('b3ccd1bbc820bc93c4b13ec4e3ec9705')
b2sums=('9f74d98ecb0b16c8b830ca8c4cb5b29520ee4fb96e70dadbfd4a8cd6114cded08393ce5b34d6475119d71161787fc7c3678802570f5d7797f4caa6bdfc3122b6')

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
