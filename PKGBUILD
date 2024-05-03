# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=netZooR
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('904aea3017f4cb3bedf5e66c31c3745c')
b2sums=('244b18a98511ef6b01ae94e869f8eb7c0f13fdddd9d4cb391f73f8ef0ead75cbf262106b6ab8f9418d50bd00d69ac5e8f06c7e2aeb7f9a62bc28ddffbdc230eb')

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
