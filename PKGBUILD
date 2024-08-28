# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=harmony
_pkgver=1.2.1
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
md5sums=('ee99f87a217fe3919840477df01fce22')
b2sums=('378aca91dafd95134c3836e5f78b6bb1d64df093f37ea1fb044edc3814901c5019a62e20c37db9b0f23bcd3b6df4c55de200e855717ba3311bf6c5fc4b44b56d')

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
