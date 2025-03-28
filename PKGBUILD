# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DESpace
_pkgver=1.6.1
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
md5sums=('1b1542360cdb68f94b56182f5006ddd6')
b2sums=('f38434d3de3068f5b3c86b0ace59217befc7bb2c4190de28964d3583a8ad4d5acdba41301b32a47cd23be395fb78d7d067947c4a982dd94acfae4f8611c3e451')

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
