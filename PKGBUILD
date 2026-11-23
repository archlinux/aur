# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MsQuality
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quality metric calculation from Spectra, MsExperiment and Chromatograms objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-chromatograms
  r-ggplot2
  r-htmlwidgets
  r-metabocoreutils
  r-mscoreutils
  r-msdatahub
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
md5sums=('49c5f3ab8944ab05cb90eb2a295ecb44')
b2sums=('fc9c19666acdf944046cbf0120d3925fbae8ebc33fc92cc8a4ab7b20d6a2a6a92aa81b8f13a52e17dcb502f6361fd49438bb14d6eaa6b2bba01a59e70497bae8')

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
