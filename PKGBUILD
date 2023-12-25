# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigrquery
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="An Interface to Google's 'BigQuery' 'API'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL3)
depends=(
  r-assertthat
  r-bit64
  r-brio
  r-cli
  r-curl
  r-dbi
  r-gargle
  r-glue
  r-httr
  r-jsonlite
  r-lifecycle
  r-prettyunits
  r-progress
  r-rcpp
  r-rlang
  r-tibble
  r-withr
)
makedepends=(
  r-rapidjsonr
)
checkdepends=(
  r-blob
  r-dbplyr
  r-dplyr
  r-testthat
  r-wk
)
optdepends=(
  r-blob
  r-covr
  r-dbitest
  r-dbplyr
  r-dplyr
  r-hms
  r-readr
  r-sodium
  r-testthat
  r-wk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('82e0f0e163cd2716a4c0996a2c4e0321')
b2sums=('7426985c0e4cbd3c2f6daf9a76f0f87650209bf9d70b62629a763760fe6243226b2026ab28e8854cfdbc7d15d11a27d54f6587958ba448ee539accb6ec08d7f1')

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
