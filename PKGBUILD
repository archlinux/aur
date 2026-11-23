# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gemma.R
_pkgver=3.8.1
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
md5sums=('9dd9ba6447ff7f62be5b2f70fb893f3a')
b2sums=('7407abcde70e61eb3f45ec418c282dc996092a85dea5b56a1ffbc204d63af97a5133c0a2f2108e5e32382b4ed1ee6a08f8108db17cb6ee99a58db9405a7dd204')

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
