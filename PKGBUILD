# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scRNAseqApp
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
  r-dbi
  r-dt
  r-genomeinfodb
  r-genomicranges
  r-ggdendro
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-ggridges
  r-gridextra
  r-htmltools
  r-iranges
  r-jsonlite
  r-magrittr
  r-patchwork
  r-plotly
  r-rcolorbrewer
  r-refmanager
  r-rhdf5
  r-rsamtools
  r-rsqlite
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
md5sums=('cad3212d6fa3ad4efbd99dc2b489a441')
b2sums=('24a01680d7698164289e1e4200807241e46aefe21caf61175f7ec8b016c4d913c4eca919948c0ba4e4a91749de58f20f0e2527b87ed1493d47190a5784bd4122')

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
