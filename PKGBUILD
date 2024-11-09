# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EDIRquery
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Query the EDIR Database For Specific Gene"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
  r-interactionset
  r-readr
  r-tibble
  r-tictoc
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('db302d2df4cfbadc64b20c9d9c800cbf')
b2sums=('8475476ce30d057a49d4a0dafc6bc0cb68373453e686cd581c7abbdb9e8cf333bd4610cfbe43a7a49c0074e22284d058c485dbc6a1fef7324fd2e9ba6425badd')

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
