# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scRNAseqApp
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A single-cell RNAseq Shiny app-package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('b4f7531bb146fb8ba3d53e55713e51003e67833fca25fc8807fb7a26d1e82ad3d3d535663869b046d1cfa6300365c50653965c095352afe3a0da380b11550cad')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
