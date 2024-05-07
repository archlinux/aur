# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=COTAN
_pkgver=2.4.1
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
md5sums=('9f4a66c367115dcd68c67e0334693376')
b2sums=('18ad3f916c009e361118a43fe2bc0c0228479159547abf1d11bbaf13e977fcf8fe84249805ccc0983900c05b3ff7da1980df0261fac908316b7a9a0a07e13f9f')

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
