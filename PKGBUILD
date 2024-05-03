# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DESpace
_pkgver=1.4.0
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
md5sums=('c9b686bd20d756891e8898d54039b1f4')
b2sums=('c02785321a5c5af0ed66bdd52981b170ece0fc54e0556892c62b4adb05424715c1d993a4d19683bfeee9312c9f851e023f12976a81533c098d4acdb0b23c47dd')

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
