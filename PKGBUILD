# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatialHeatmap
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="spatialHeatmap"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
  r-distinct
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
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2fe3c68f9bbfb419d0afd3d329e65747')
sha256sums=('1e9edcd4ba6b1a5458a00e53d0f332faa4dd6e0aa76ac864a1170abcf9a1dbaf')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla runTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
