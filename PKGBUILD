# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=demuxmix
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Demultiplexing oligo-barcoded scRNA-seq data using regression mixture models"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggplot2
  r-gridextra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-dropletutils
  r-knitr
  r-reshape2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9bbdcc634e542fe151a50a2511206140')
b2sums=('9e18c0c6bfe15d5d788dcfad8371386b67e71f525ea20ce3a09f6a28b398141979031493fa47f602a4fae1fec4536ecee8ce82264fc1b4bbb367564856bd2ffe')

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
