# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsQuality
_pkgver=1.4.0
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
md5sums=('02b69afab89b5a5555705937db09a190')
b2sums=('a055218459c1144c26a99d967973dbab7f7f63ddd18daecc0e38428bffb7430a54bd00cb94fa73dcf23b520289bc3a266c07e7b98309d0bf9dbbfbd872764450')

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
