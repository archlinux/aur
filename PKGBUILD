# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=COTAN
_pkgver=2.4.3
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
  r-torch
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('348f8aca1deb5d63af8a0bfd7758e488')
b2sums=('eb4555dfa6011a8d1ba12f04b3e2118f782ab7908c1aa7b0b6489483111ea4d9e57f139d571045be9c9fbddca426b62f69b04125875b5fd394b6c1122fb63cd2')

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
