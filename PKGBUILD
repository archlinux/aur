# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MoleculeExperiment
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('d8fef705349bc9464ae152cd47bb9a58')
b2sums=('7b8e468410220c10682b43f0c8990a7e3504cbe8302e8ee92f45b5b1b8192c928c90a7e09e468ab87b9bb2c341a1a69e029f02aebc2e4d4dd553be5139218b35')

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
