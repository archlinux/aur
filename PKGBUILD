# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DESpace
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a framework to discover spatially variable genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-biocgenerics
  r-biocparallel
  r-cowplot
  r-data.table
  r-dplyr
  r-edger
  r-ggforce
  r-ggnewscale
  r-ggplot2
  r-ggpubr
  r-limma
  r-patchwork
  r-s4vectors
  r-scales
  r-spatialexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-statmod
  r-testthat
)
optdepends=(
  r-biocstyle
  r-concaveman
  r-experimenthub
  r-knitr
  r-purrr
  r-rmarkdown
  r-scuttle
  r-spatiallibd
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('98a7395caa0d843520f62f06386483b9')
b2sums=('7ed828ea39b99237160ba30dbce0e9125b48aa41802d0e8ebada24ca395e97662dc84af6802b99ec18dfb991a9e28b4e0cdb9ae15bf2643a5419a0890fd2df31')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testhat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
