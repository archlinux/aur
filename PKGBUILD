# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RBioFormats
_pkgver=1.12.0
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
md5sums=('beb9e76977a4e06f7a885743fff69312')
b2sums=('4b6e0ab898fed8c15442fe73045226738578cc2e31c51e160850aea6d7af71686d760e34bcb45909361b71c2114b5b601ceb397ab8f624819dc14b61bb42117e')

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
