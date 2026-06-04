# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=harmony
_pkgver=2.0.4
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
md5sums=('6cdf258b8ae47bf9d9f48e397f320747')
b2sums=('11392387279585535aa410bcf4bbf0ed7fa0abc7e2be3fb7adc5864fbefd838c8ff9717aa93adc0e3f5c49a1c4065aa9b6fbc3003e1e5520985ab735e681e0f7')

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
