# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MoleculeExperiment
_pkgver=1.8.0
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
md5sums=('84263262195b84958ec78f0d8831f16d')
b2sums=('dc1d5edb8ee04814a69a6412a30650cef51a377fa8af02e11ccfaa293a99429e48786f451393c992fdd1988a9eacdd6cec88726bc2ea977c98f1faeec3321115')

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
