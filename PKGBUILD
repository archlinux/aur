# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=paws.common
_pkgver=0.7.5
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
md5sums=('ebf2ef2d357841f7503842085251ae35')
b2sums=('01dd15669609c79ba6b40a4daac820af1661b735728be6d33199fba36d775a8aadfb01ec3304c583c460cf04270bbb652bbcad14f603b9a89ac41c8ccee54ea8')

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
