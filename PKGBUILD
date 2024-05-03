# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hoodscanR
_pkgver=1.2.0
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
md5sums=('b0b8a128b68416ead2eafb0ddddcde72')
b2sums=('a6db1fc8e26fcc75f1cef8d0ab6ac05666c69f0530e43f6d1f374e814bdd75c0dd9a599147dc3287f67de92555233eb39327c98a7af00d3f046130e7a9e870ac')

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
