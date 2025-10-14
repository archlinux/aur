# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hicVennDiagram
_pkgver=1.6.1
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
md5sums=('d34fb9c97e5af2a18d85d31a1920249b')
b2sums=('f80ed0b0541b6433cf81995db95caa48a5a7a843716feb9a763f0b53ebc5a229191c49edfc3f471c477c7af43f22bef012e5646c7acf4a4e99a39143bc96f750')

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
