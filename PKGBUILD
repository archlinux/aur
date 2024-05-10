# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hicVennDiagram
_pkgver=1.2.0
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
md5sums=('313574d5ead069cabeb5aafa7bbae093')
b2sums=('66953fd68d7e4bda96027956cc5e782dad88e34bf1f543a80699c6f1e6970af305050d932c68e73c740a13e49137eb2f5616d0cad9d6088baea2f486a4c2ff02')

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
