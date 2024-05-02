# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=PanViz
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Integrating Multi-Omic Network Data With Summay-Level GWAS Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-colorspace
  r-data.table
  r-dplyr
  r-easycsv
  r-futile.logger
  r-igraph
  r-magrittr
  r-rcolorbrewer
  r-rentrez
  r-rlang
  r-stringr
  r-tibble
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-networkd3
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('50cc9b4020ab64a905e78fa0e5144756')
b2sums=('77421e2f51df0161cc5d2eb6e7916c7b7fe11e0c72cdcf3f5af86da4f1b07fc75b7ed985ac920f2a49c9af6ac3de7bc64f638b35e8a8027229dc85dfd3542a42')

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
