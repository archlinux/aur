# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOexplorer
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GEOexplorer: a webserver for gene expression analysis and visualisation"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('213a1b499ce1d0640b267c8fb41e3204')
sha256sums=('fce2f86eb58a9ba5892e33f9d4c31d6b05a129c16096e2ba021d8ab6b0d412ca')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
