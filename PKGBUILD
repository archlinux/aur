# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsQuality
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MsQuality - Quality metric calculation from Spectra and MsExperiment objects"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-biocparallel
  r-ggplot2
  r-htmlwidgets
  r-msdata
  r-msexperiment
  r-plotly
  r-protgenerics
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
md5sums=('1d8e2101f472e8fc93bfa275db511982')
sha256sums=('8b461e0582838a0cf9e0bd79a118852717621d75f0e7c7a172d46ed7bae49a93')

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
