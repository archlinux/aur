# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gemma.R
_pkgver=3.2.0
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
  r-lubridate
  r-magrittr
  r-memoise
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
  r-kableextra
  r-knitr
  r-listviewer
  r-magick
  r-microbenchmark
  r-pheatmap
  r-poolr
  r-purrr
  r-rmarkdown
  r-shiny
  r-testthat
  r-viridis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7a91640afaf517a51ef99db1851a5afd')
b2sums=('9e92ce1cd1b90318822ba8a8ea89d641bb347f47b0d8d8bb86aea0927e7f2f3183dd230c210d4a41df911d374d1e4e21e9cfc9a198b0c47b59d35f7daf6bd9d0')

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
