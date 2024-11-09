# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hicVennDiagram
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Venn Diagram for genomic interaction data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-complexupset
  r-eulerr
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-htmlwidgets
  r-interactionset
  r-iranges
  r-reshape2
  r-rtracklayer
  r-s4vectors
  r-svglite
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-chippeakanno
  r-knitr
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0a2b9d864d34d269d6dd47b00ac6e46a')
b2sums=('b02de9a81015949a67d314055d4bd8b5334657a199569f4f51a00783856fc656b46144a3e8053342e3afeda6bc8d4042a75a5527487e37d669be55a359fb125e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
