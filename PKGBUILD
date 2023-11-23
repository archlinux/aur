# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=demuxmix
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Demultiplexing oligo-barcoded scRNA-seq data using regression mixture models"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
sha256sums=('7c75413797bcd86cb1c83372f02c3361666d47930ba3a52da5498e0bb52d8a83')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
