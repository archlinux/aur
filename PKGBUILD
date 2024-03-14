# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigrquery
_pkgver=1.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Interface to Google's 'BigQuery' 'API'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-bit64
  r-brio
  r-cli
  r-clock
  r-curl
  r-dbi
  r-gargle
  r-httr
  r-jsonlite
  r-lifecycle
  r-prettyunits
  r-rlang
  r-tibble
)
makedepends=(
  r-cpp11
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
  r-dbplyr
  r-dplyr
  r-hms
  r-readr
  r-sodium
  r-testthat
  r-withr
  r-wk
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('376d3dd9cc24238405bea427af4bab97')
b2sums=('a33316684152a954f002b5350ff772f2333b1a6ab0f202a4782eb7199a3a83ee848f2aab38266ea0ee6aaec0927a5f7b6a8509a3c4ec56157bde12a5867a83ec')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
