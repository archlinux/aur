# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SARC
_pkgver=1.4.0
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
md5sums=('e9da6decb3dcdfca23fcb7cef3cfe455')
b2sums=('5a55214038dab78628bddb8aa2679f897858343bcf864d9e181b439c7ac46e2545c6ddd8ee14a2b245e76bd0cbcba02dcc3313c3cfa1548c01e32a9ce3390e56')

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
