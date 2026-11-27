# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gDRcore
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Processing functions and interface to process and analyze drug dose-response data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-bumpymatrix
  r-checkmate
  r-data.table
  r-drc
  r-futile.logger
  r-gdrutils
  r-jsonlite
  r-multiassayexperiment
  r-purrr
  r-s4vectors
  r-stringr
  r-summarizedexperiment
)
checkdepends=(
  r-gdrimport
  r-gdrtestdata
  r-testthat
)
optdepends=(
  r-biocstyle
  r-gdrimport
  r-gdrstyle
  r-gdrtestdata
  r-iranges
  r-knitr
  r-pkgbuild
  r-qs2
  r-testthat
  r-yaml
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('23d9e4cbcbeecc58ff0409eb119eeed4')
b2sums=('7dbf303c26a541fb8101c4b1b04d6ac0b9194b1c6fa2b21860aea3cee8bd4cf438c704844630bf692f8bb13c97858de236a66614942bdc41a25467ac22290627')

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
