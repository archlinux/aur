# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=googledrive
_pkgver=2.1.2
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
  r-knitr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8aeb39196ae48307a903bba1e5d73fa5')
b2sums=('620dc264b9c7b97ed2cf8059dfcdad09e011fa50aee7a39e0448c25c64028cabe9e4b940619089eb93c3e3518c6e616bbd39f800ba956318f3476422d4f89d89')

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
