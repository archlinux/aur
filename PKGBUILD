# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scRNAseqApp
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A single-cell RNAseq Shiny app-package"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-bibtex
  r-bslib
  r-circlize
  r-complexheatmap
  r-data.table
  r-dt
  r-genomeinfodb
  r-genomicranges
  r-ggdendro
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-gridextra
  r-hdf5r
  r-htmltools
  r-iranges
  r-jsonlite
  r-magrittr
  r-patchwork
  r-plotly
  r-rcolorbrewer
  r-refmanager
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-scrypt
  r-seurat
  r-seuratobject
  r-shiny
  r-shinyhelper
  r-shinymanager
  r-singlecellexperiment
  r-slingshot
  r-sortable
  r-xfun
  r-xml2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a9b64e980a9e0acef5ab93a44a35e124')
sha256sums=('4946c8bc3f9cfb78550ced2e8cd24056b2490b1956ef6ab143b491cb6203e8a0')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
