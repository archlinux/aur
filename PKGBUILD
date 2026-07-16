# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MoleculeExperiment
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Prioritising a molecule-level storage of Spatial Transcriptomics Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-cli
  r-data.table
  r-dplyr
  r-ebimage
  r-ggplot2
  r-magrittr
  r-purrr
  r-rhdf5
  r-rjson
  r-rlang
  r-s4vectors
  r-spatialexperiment
  r-terra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1b9f8b848ae27247eeca88d61a41c916')
b2sums=('727a3219b4c20d5fe3afb3df80e07a358e61e8afadf2be571b3249cbb1f36f908d29ecda57d29100592cf19d8669b41133ce3b0dad11dec0e4b054c6a9ed340c')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
