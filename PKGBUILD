# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Statial
_pkgver=1.4.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package to identify changes in cell state relative to spatial associations"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biocparallel
  r-concaveman
  r-data.table
  r-dplyr
  r-ggplot2
  r-limma
  r-magrittr
  r-plotly
  r-purrr
  r-ranger
  r-s4vectors
  r-singlecellexperiment
  r-spatialexperiment
  r-spatstat.explore
  r-spatstat.geom
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-tidyselect
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-classifyr
  r-ggsurvfit
  r-knitr
  r-lisaclust
  r-spicyr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e7151f23bb952401803e4d239390c210')
sha256sums=('b89442b4b517f18f08c3fc7052c16d17473a4b0c771bc3faba7787f6989d32c3')

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
