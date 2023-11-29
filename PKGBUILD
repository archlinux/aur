# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=harmony
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast, Sensitive, and Accurate Integration of Single Cell Data"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  blas
  lapack
  r-cowplot
  r-dplyr
  r-ggplot2
  r-rcpp
  r-rhpcblasctl
  r-rlang
  r-tibble
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
md5sums=('4c40181d0401b1e3e6350d40806b08ed')
sha256sums=('a63c7d7cbbc5d183e8f919552e9d73044e0a89660856e80861a00eb5d25ac7b5')

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
