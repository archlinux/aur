# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hicVennDiagram
_pkgver=1.0.1
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
  r-ggplot2
  r-htmlwidgets
  r-interactionset
  r-reshape2
  r-rtracklayer
  r-s4vectors
  r-svglite
)
checkdepends=(
  r-genomicranges
  r-testthat
)
optdepends=(
  r-biocstyle
  r-chippeakanno
  r-genomicranges
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6c8f208d9ee46b9dd61e112e9c9b725e')
b2sums=('1afbe0ad3938b70817bc55e50d5ab3d25fab2e8bec7ef4dce6931b9f7dbb625db2f3aebb81430cf5dc7670de99c239c87deb6e03763ee89a9e0b26f0a3c2ffe6')

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
