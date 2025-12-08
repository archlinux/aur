# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=common
_pkgver=1.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Solutions for Common Problems in Base R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC0-1.0')
depends=(
  r
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-box
  r-glue
  r-knitr
  r-rmarkdown
  r-rstudioapi
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1cc6a998857721e1054aa5cdb31fbbd6')
b2sums=('57b1dca7559bccd069f8f0b4972ff4b89ba4306bd25e2781b10b1b5743b5ade663e700fd80f9d9a96cc765abe8fa520961d367c3152d26ce84c5c71dc4b07868')

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
