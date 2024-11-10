# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsQuality
_pkgver=1.6.0
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
md5sums=('4f5ec7a8df26bc6542bb6d3f2a7b9a6b')
b2sums=('699325433e48a166ed5fc4638ee0029d6defcb888e2a87bfad6da3d2bbe205ac9e08a6e78e8dafb9931f9a1e29478873087bb2330950d7753c4ca2323a74b723')

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
