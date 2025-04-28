# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hicVennDiagram
_pkgver=1.6.0
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
md5sums=('d8d59a4908e4a6795fcbbae1b97c6783')
b2sums=('044047a119d3aa35cdb35bdf9983b25c0df09596f17ab783402f6b4f2296085f7d7ec4fd59a4d898faf0b38206efd584da193e51ed99a3fb71858c1cbdd94b14')

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
