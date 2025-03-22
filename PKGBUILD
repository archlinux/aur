# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=scRNAseqApp
_pkgver=1.6.1
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
  r-colourpicker
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
md5sums=('d272f5de9b2a82bf3f4e6f15338e9457')
b2sums=('18b09e086133ba02aa6083ddb1bd8e999c1091420bd48b01d7426f6fe62a413ee8dcf469ba720e0823f84b687bd03914256ff4c04554fba613223e587608a2c4')

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
