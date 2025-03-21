# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CytoPipelineGUI
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GUI's for visualization of flow cytometry data analysis pipelines"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-cytopipeline
  r-flowcore
  r-ggplot2
  r-plotly
  r-shiny
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocstyle
  r-diffviewer
  r-knitr
  r-patchwork
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2cd6a8f5eb5b986c2a2935c5b7c294a9')
b2sums=('3c4c51cc94e887799a8570a89e5855ee7e233e7b7e7a34b5bb4709fcb6a35833f60e78d09911f3c76436b8914b6fa3d05ea6511cb9d3a637d75d7404ef01be11')

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
