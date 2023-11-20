# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=CytoPipelineGUI
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="GUI's for visualization of flow cytometry data analysis pipelines"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('fb6a6a7aad638be11919a144f3d9907a')
sha256sums=('18c568b019b283ba117d278606c02db621b389dd5a5494699643f109064ad925')

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
