# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gemma.R
_pkgver=3.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A wrapper for Gemma's Restful API to access curated gene expression data and differential expression analyses"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(Apache)
depends=(
  r-assertthat
  r-base64enc
  r-biobase
  r-bit64
  r-data.table
  r-digest
  r-glue
  r-httr
  r-jsonlite
  r-kableextra
  r-lubridate
  r-magrittr
  r-memoise
  r-pheatmap
  r-r.utils
  r-rappdirs
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
checkdepends=(
  r-microbenchmark
  r-shiny
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-dplyr
  r-ggplot2
  r-ggrepel
  r-knitr
  r-listviewer
  r-magick
  r-microbenchmark
  r-poolr
  r-purrr
  r-rmarkdown
  r-shiny
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa6d367b52f96163df2cef7aa40131a1')
b2sums=('a09e1f90f20c77e26c005be42a78406c43b0bb97b3b8400166d5b2c3a6211f27ca60c8381f192d2cd8f2f4881d3954b9af1709c8054a41ca298788e2b0572ff5')

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
