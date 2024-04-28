# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GEOexplorer
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('213a1b499ce1d0640b267c8fb41e3204')
b2sums=('1b45228e579611570e26a5346345b806915542ebdae65d42e2f70413570dbeb426a7b65663ea7edf2e5925e1eb585f726b14e499049e39391ad7c6ccdcf31d48')

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
