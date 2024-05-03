# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Statial
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package to identify changes in cell state relative to spatial associations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
md5sums=('2c77e967b17130dd31b95ecf030b4fa8')
b2sums=('0d02fb255a51254884b5a8ae42ab4307aa4c65534abb6aeadfda99ae3a7362187b04e316fd29a4b647142152cd0ec661906841f1274e24673bca25bd07a22be3')

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
