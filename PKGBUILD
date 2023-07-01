# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Pranav K Anupam <pranavanupam@yahoo.com>

_pkgname=googledrive
_pkgver=2.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="An Interface to Google Drive"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
  r-mockr
  r-rmarkdown
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2741deb58d88bacd81489316df7cf9e2')
sha256sums=('0b8b4f74ba3630b0347249a32a80bc5fc2e8b63ad2952702f30162bd2d38fb82')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
