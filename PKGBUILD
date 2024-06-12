# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpotClean
_pkgver=1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="SpotClean adjusts for spot swapping in spatial transcriptomics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-ggplot2
  r-rcolorbrewer
  r-readbitmap
  r-rhdf5
  r-rjson
  r-rlang
  r-s4vectors
  r-seurat
  r-spatialexperiment
  r-summarizedexperiment
  r-tibble
  r-viridis
)
checkdepends=(
  r-r.utils
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-r.utils
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9254e4550c9f53fd09b4cbdabfb825e3')
b2sums=('e39c37bd2139c6f6cd8ad670d8920d7bb0fa40a823641a0e1d19a1a5ab9a16f550b186222b557c6000c75cb0f619549487cc96f546e0b16ce5f051dce21fb035')

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
