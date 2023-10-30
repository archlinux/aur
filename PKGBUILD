# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=spatialLIBD
_pkgver=1.13.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="spatialLIBD: an R/Bioconductor package to visualize spatially-resolved transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-annotationhub
  r-benchmarkme
  r-biocfilecache
  r-biocgenerics
  r-cowplot
  r-dt
  r-edger
  r-experimenthub
  r-fields
  r-genomicranges
  r-ggplot2
  r-golem
  r-iranges
  r-jsonlite
  r-limma
  r-magick
  r-paletteer
  r-plotly
  r-png
  r-rcolorbrewer
  r-rtracklayer
  r-s4vectors
  r-scater
  r-scuttle
  r-sessioninfo
  r-shiny
  r-shinywidgets
  r-singlecellexperiment
  r-spatialexperiment
  r-statmod
  r-summarizedexperiment
  r-tibble
  r-viridislite
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocmanager
  r-biocstyle
  r-covr
  r-here
  r-knitr
  r-lobstr
  r-refmanager
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ce04856a64e262857cf708de58570400')
sha256sums=('ae75b39b2c4fed429cc332118c13be77337353deb8b3adf370e775cb98572c07')

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
