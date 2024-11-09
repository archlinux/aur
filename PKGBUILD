# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hoodscanR
_pkgver=1.4.0
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
md5sums=('c61ed5273654b20c204142213c309391')
b2sums=('0d996984edf16c5b7b13834097f0f72078b133cbd957af87f15ccc267baf72d2468955122938eb4002b6b849702405c9d7281cafa9aec66e3230eb7e6c758870')

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
