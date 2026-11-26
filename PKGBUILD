# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CytoPipelineGUI
_pkgver=1.12.0
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
md5sums=('2d98c5206fdd948ff61078b0331d3a62')
b2sums=('2c9816b43d068e48951ecaf49f0177e7714f9c02cdf55562613361133a8cf2982077b581f2b1202e6cb3f8abb47dd8d24a7ecaf34ff3bab84525b0d19007443d')

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
