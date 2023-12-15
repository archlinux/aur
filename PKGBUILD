# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DESpace
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="a framework to discover spatially variable genes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
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
b2sums=('a351a2973c8b752c97d79f4a131a5b28e92d7f9a2c7e4574a2febe393626bfeff6ead00645be11f7fc5a5645ea594534edac0058106e8751053149b30df4f38e')

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
