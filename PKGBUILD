# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paws.common
_pkgver=0.8.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Paws Low-Level Amazon Web Services API"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache')
depends=(
  pandoc
  r-base64enc
  r-curl
  r-digest
  r-httr2
  r-jsonlite
  r-rcpp
  r-xml2
)
checkdepends=(
  r-mockery
  r-testthat
)
optdepends=(
  r-covr
  r-crayon
  r-mockery
  r-rstudioapi
  r-testthat
  r-withr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e28f7dc4041e59a656f96e33bad984e1')
b2sums=('2cee81a30da9fdf6796f998e44ea15d708d334bd310cdfef818bfc227d06383954369f8295fad53e87f00392fff38a844a7345c48c0a5f60415fa53045ad731b')

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
