# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=googledrive
_pkgver=2.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An Interface to Google Drive"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-cli
  r-gargle
  r-glue
  r-httr
  r-jsonlite
  r-lifecycle
  r-magrittr
  r-pillar
  r-purrr
  r-rlang
  r-tibble
  r-uuid
  r-vctrs
  r-withr
)
checkdepends=(
  r-dplyr
  r-mockr
  r-testthat
)
optdepends=(
  r-curl
  r-dplyr
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1fb09b1ba4fed95d93b03406bb0447f5')
b2sums=('37819a62249e0b5c05c748a9afebe7508cc2a1e98afed80eeb83c1012185990ca1f05c949157f53895c16077558a5a0a804d36d1f544484718728fc1228310a2')

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
