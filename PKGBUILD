# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigrquery
_pkgver=1.6.2
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
  r-nanoparquet
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
  r-bigrquerystorage
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
md5sums=('ce2336eaa24ba2b57141ab18d58a20f6')
b2sums=('7a9519182c8c24a0ee37903fdfacece8ad7329d0697be42a1f03da044db14e3b2995a08cf3f8779c5a47bf2d8e6a7ef4fbaa32756c78d72b7f074c4755269c51')

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
