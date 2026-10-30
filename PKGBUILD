# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hoodscanR
_pkgver=1.10.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spatial cellular neighbourhood scanning in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-circlize
  r-complexheatmap
  r-ggplot2
  r-knitr
  r-rann
  r-rcpp
  r-rlang
  r-rmarkdown
  r-scico
  r-spatialexperiment
  r-summarizedexperiment
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ad3d4ea6e5d4da71ec054ff5b529cc42')
b2sums=('1ebead8606ba252eeed69b02a4cc3e31cac31b2cdd51ec7889f5943ad2785ac2b7a69396148185344d4c4656015c6a35a92f7ecc47f7dbce003be28f626d7073')

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
