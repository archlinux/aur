# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MoleculeExperiment
_pkgver=1.4.1
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
md5sums=('cbb9fe45e74673215d8c4effcaadf06b')
b2sums=('559f4f79b7d6b23c8c4c53798f9d72fb5f2c9d85fd616098fa4d4aaf8cf96e0124e78e198b26c53d8a8f827bc3459eff139cc07ed8419cb8d054d3d3f77bd52d')

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
