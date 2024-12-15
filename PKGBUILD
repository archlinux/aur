# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellBarcode
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cellular DNA Barcode Analysis toolkit"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biostrings
  r-ckmeans.1d.dp
  r-data.table
  r-egg
  r-ggplot2
  r-magrittr
  r-plyr
  r-rcpp
  r-rsamtools
  r-s4vectors
  r-seqinr
  r-shortread
  r-stringr
  r-zlibbioc
)
makedepends=(
  r-bh
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('033800efd6a20b732a66ea8993054ca6')
b2sums=('983928f68e209c274f468853f9eb23a7478e32c568a438098056ea9a60d3ecdaf5b22f4ee9080db6eda34333a28c88d2d7d6a71ca2044c959fbc83acb4d7f131')

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
