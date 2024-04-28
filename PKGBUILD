# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=netZooR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Unified methods for the inference and analysis of gene regulatory networks"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-annotationdbi
  r-assertthat
  r-biobase
  r-data.table
  r-doparallel
  r-dplyr
  r-foreach
  r-ggdendro
  r-ggplot2
  r-go.db
  r-gostats
  r-gplots
  r-igraph
  r-matrixcalc
  r-matrixstats
  r-org.hs.eg.db
  r-pandar
  r-penalized
  r-rcy3
  r-reshape
  r-reshape2
  r-reticulate
  r-stringdb
  r-tidyr
  r-vegan
  r-viridislite
  r-yarn
)
checkdepends=(
  python-pandas
  python-scipy
  r-testthat
)
optdepends=(
  "python-pandas: pandaPy and lionessPy"
  "python-scipy: pandaPy and lionessPy"
  r-knitr
  r-pkgdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2f4adb3763df2df201212073e34bab10')
b2sums=('1997a8481d0d1733e76009e5d8cb3d51f8d9a7e711000a7b6a82ab4064802c22846d18731d8944f9848a7e284354bba58da90bbec60b4e92fbdddbcd619b325f')

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
