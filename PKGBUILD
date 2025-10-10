# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=harmony
_pkgver=1.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast, Sensitive, and Accurate Integration of Single Cell Data"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
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
md5sums=('433148e2c258590bfcf15937aee34ff7')
b2sums=('1ff29e88a30660dc67b45ff2f2d6a973024e59d0038ddff0cbaa43cce064fe5d9343fee491eecac63fd148cb5e79b13ad228f03e3414fd5a0e6f135053d4782d')

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
