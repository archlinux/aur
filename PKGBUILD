# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paws.common
_pkgver=0.8.7
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
md5sums=('765de2be2b5debffb65748fcfb70fb5e')
b2sums=('1048b5a61703f5a0e91a5f7e8aa00311b0fd14223e03ec1635b6a1cfea3289c5eaa030bc757d31b53ddc206af740863778f27438f3808712a5d04c74e82e75c3')

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
