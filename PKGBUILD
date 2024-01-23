# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bigrquery
_pkgver=1.5.0
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
md5sums=('3e011bbd218921b16f42c1147d66b118')
b2sums=('e808a229740407a387ee2384bc30b944394d8cc85511fe2ebbe187c7a6368a554415fda7beb3ac3b3e889ec18f128f593c6177ebba461dcf2ab9a52b467e959a')

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
