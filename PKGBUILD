# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=COTAN
_pkgver=2.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="COexpression Tables ANalysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-biocsingular
  r-circlize
  r-complexheatmap
  r-dendextend
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-ggthemes
  r-paralleldist
  r-parallelly
  r-pcatools
  r-plyr
  r-rcolorbrewer
  r-rfast
  r-rlang
  r-scales
  r-seurat
  r-stringr
  r-tibble
  r-tidyr
  r-umap
  r-withr
  r-zeallot
)
checkdepends=(
  r-r.utils
  r-testthat
)
optdepends=(
  r-biocstyle
  r-cowplot
  r-data.table
  r-geoquery
  r-gsubfn
  r-htmlwidgets
  r-knitr
  r-plotly
  r-proto
  r-qpdf
  r-r.utils
  r-rmarkdown
  r-rtsne
  r-sf
  r-spelling
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9bf9209fe9feef0c69493cff1ab4ed24')
b2sums=('0729ec6acbd58c05567f2801d9fe7104be2846b051bc83aa7559b9d0658534587870d5fb585560e0efffca2089639200b69bb1e9ed58abd7dcc30eab09b4b2e4')

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
