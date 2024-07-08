# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paws.common
_pkgver=0.7.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Paws Low-Level Amazon Web Services API"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(Apache)
depends=(
  pandoc
  r-base64enc
  r-curl
  r-digest
  r-httr
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
md5sums=('a28d718d1b73b9fb6551bb2f0e620bc8')
b2sums=('84dfdc8546883f9e6317bed4db0fb0f11ece42d01675dfe02da48be5e766cb06af8acf13fc879e3cc4ddf9d5d52ef27e3b79bf9bfe30fe4cd4d9b0049a713137')

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
