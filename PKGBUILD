# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatialHeatmap
_pkgver=2.10.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Creating spatial heatmaps from R and Shiny"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-data.table
  r-dplyr
  r-edger
  r-genefilter
  r-ggplot2
  r-ggplotify
  r-gplots
  r-gridextra
  r-grimport
  r-igraph
  r-reshape2
  r-rsvg
  r-s4vectors
  r-scater
  r-scran
  r-scuttle
  r-shiny
  r-shinydashboard
  r-singlecellexperiment
  r-spscomps
  r-summarizedexperiment
  r-tibble
  r-xml2
)
checkdepends=(
  r-biocfilecache
  r-biocgenerics
  r-deseq2
  r-expressionatlas
  r-flashclust
  r-runit
  r-wgcna
)
optdepends=(
  r-annotationdbi
  r-av
  r-biobase
  r-biocfilecache
  r-biocgenerics
  r-biocparallel
  r-biocsingular
  r-biocstyle
  r-cachem
  r-dendextend
  r-deseq2
  r-dt
  r-dynamictreecut
  r-expressionatlas
  r-flashclust
  r-geoquery
  r-ggdendro
  r-hdf5array
  r-htmltools
  r-htmlwidgets
  r-kableextra
  r-knitr
  r-limma
  r-magick
  r-memoise
  r-org.at.tair.db
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-plotly
  r-proc
  r-rappdirs
  r-rhdf5
  r-rmarkdown
  r-rols
  r-rtsne
  r-runit
  r-seurat
  r-shinybs
  r-shinyjs
  r-shinywidgets
  r-sortable
  r-sparkline
  r-spsutil
  r-upsetr
  r-uwot
  r-visnetwork
  r-wgcna
  r-xlsx
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4b23dab35de4ffbebd99e27b327de846')
b2sums=('5e32432ed03b0b92de0ef6ef5d215696c99503c85a46917d34f89ef19d53269768ebdadc7be00e6e931ad5c6df2f1f8dda1bd12f76ece4231e2c98b621b47ac2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
