# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DESpace
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="DESpace: a framework to discover spatially variable genes"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('436915bded5ec94da6e412ccdff80e8e')
sha256sums=('0a50ce9a81bcc3108da8b92cefe9c22b93903129be8faf8529653eefce832998')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testhat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
