# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsQuality
_pkgver=1.8.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quality metric calculation from Spectra and MsExperiment objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-ggplot2
  r-htmlwidgets
  r-msdata
  r-msexperiment
  r-plotly
  r-protgenerics
  r-rlang
  r-rmzqc
  r-shiny
  r-shinydashboard
  r-spectra
  r-stringr
  r-tibble
  r-tidyr
)
checkdepends=(
  r-mzr
  r-s4vectors
  r-testthat
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-dplyr
  r-knitr
  r-mzr
  r-rmarkdown
  r-s4vectors
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af005f2f37bb40fc6c6d080ce339f7fb')
b2sums=('0cebe5ab75dd7fa3eb4c9d473bd3a391f6c731eccebb86fc4d1938199a0b1db2486c7f09dcc23bc79d2cba369971dfe58d892be73c4afacdcac9d6b62874604b')

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
