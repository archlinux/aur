# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOexplorer
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="a webserver for gene expression analysis and visualisation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-car
  r-dt
  r-edger
  r-enrichr
  r-factoextra
  r-geoquery
  r-ggplot2
  r-heatmaply
  r-htmltools
  r-httr
  r-impute
  r-knitr
  r-limma
  r-markdown
  r-pheatmap
  r-plotly
  r-r.utils
  r-readxl
  r-scales
  r-shiny
  r-shinybusy
  r-shinycssloaders
  r-shinyheatmaply
  r-stringr
  r-sva
  r-umap
  r-xfun
  r-xml
  r-xml2
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-rmarkdown
  r-testthat
  r-usethis
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c5a798eedfe4bcaf2869700911560363')
b2sums=('902ee857cf064adb9370e209f28f1c002119907bd924af303cd28bed3b356b06b43036f3040995fae9ee3342a8e4e4348aa8a313e74af8954d9f68b55a6e49fd')

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
