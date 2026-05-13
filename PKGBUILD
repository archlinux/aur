# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=harmony
_pkgver=2.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast, Sensitive, and Accurate Integration of Single Cell Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cli
  r-cowplot
  r-dplyr
  r-ggplot2
  r-rcpp
  r-rhpcblasctl
  r-rlang
  r-tibble
  blas
  lapack
)
makedepends=(
  r-rcpparmadillo
  r-rcppprogress
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-data.table
  r-ggrepel
  r-ggthemes
  r-knitr
  r-patchwork
  r-rmarkdown
  r-seurat
  r-singlecellexperiment
  r-testthat
  r-tidyr
  r-tidyverse
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f962f26faed7190877ba33fcbc5c9a7d')
b2sums=('0dc685fa4d49307d608f26a67bdf2f8979fdc8e51d18de31f1c80673a22916dbf3035279cdda967eb1050a85a63ec83424b5dee34e8a8b9f7772314b7555cf68')

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
