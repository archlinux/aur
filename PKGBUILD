# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=multiWGCNA
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="multiWGCNA"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-cowplot
  r-data.table
  r-dcanr
  r-dplyr
  r-flashclust
  r-ggalluvial
  r-ggplot2
  r-ggrepel
  r-igraph
  r-patchwork
  r-readr
  r-reshape2
  r-scales
  r-stringr
  r-summarizedexperiment
  r-wgcna
)
checkdepends=(
  r-experimenthub
  r-testthat
)
optdepends=(
  r-biocstyle
  r-doparallel
  r-experimenthub
  r-knitr
  r-markdown
  r-rmarkdown
  r-testthat
  r-vegan
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b8f70e9496cf73238aa3ba3c08cb81fa')
sha256sums=('c3eebe34ffd6364531b5b768c7b5e87d10f657cd688495a05885d0307855e8ca')

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
