# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=enrichViewNet
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="From functional enrichment results to biological networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-enrichplot
  r-gprofiler2
  r-igraph
  r-jsonlite
  r-rcy3
  r-reshape2
  r-strex
  r-stringr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-testthat
  r-magick
  r-ggnetwork
  r-ggrepel
  r-ggtangle
  r-scatterpie
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('895a466c6863c93233af17b5853cbb6c')
b2sums=('05ebe62a2b14801bf8c9b26db35b010f0463fd77340d8cda66770cccde6b1525a253407f08d418ce343d13ee00122f01b822e8dd75da6c5f1915d7ab865a520b')

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
