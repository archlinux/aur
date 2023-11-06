# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MoleculeExperiment
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Prioritising a molecule-level storage of Spatial Transcriptomics Data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
sha256sums=('4ba8ae30eb0943ef480142611f1053883c32195f74f4966d3bb8c8f36272c3a0')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
