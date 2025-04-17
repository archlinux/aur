# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RBioFormats
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R interface to Bio-Formats"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  java-runtime
  r-ebimage
  r-rjava
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-testthat
  r-xml2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('63a22ebb416d889d88fc296bdccdd1d3')
b2sums=('2c9fa302e407f8b6408f5b77e44123fccba98a925374e24543d7cf57ca2eb7e9b362cdb1d7d0d894bc1d1140add6a7dd8a2de05855e66674fef98fe5abb75986')

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
