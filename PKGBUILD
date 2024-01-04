# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=COTAN
_pkgver=2.2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="COexpression Tables ANalysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(GPL3)
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
md5sums=('a3d6f259a1ad5ac8203558ca7e61a91b')
b2sums=('a0e97f4c4d0d22a5172533f21d83b667c7a999f37f0dff1bdf95d842b2dcd16683c7eb456dfaac4278f5d759f665cef671d8a313639c549fe0c1f50ac07546a2')

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
