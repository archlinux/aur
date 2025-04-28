# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=SpotClean
_pkgver=1.10.0
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
md5sums=('9bef78613def9705e44d6eff87715f78')
b2sums=('a3f36371c3d0c248e46904954f26a0755c0ed22f8fece325eb7268fc788edeed77ca99ff316444ab619f423ebe3ac4d31bbeb1d2b229b0f2c894b398089f45f9')

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
