# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paws.common
_pkgver=0.7.3
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
md5sums=('7e331bbebb23cb48538c88b37703c045')
b2sums=('7e57b629fa52b8e6b619bac3ea9a83765723298be0359390484752cae8d933a1b17ca77005693342bf7e3e637f303caf71778d503a361f9d47ffdfe882a8dedf')

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
