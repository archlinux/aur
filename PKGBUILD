# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fuzzyjoin
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Join Tables Together on Inexact Matching"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-geosphere
  r-purrr
  r-stringdist
  r-stringr
  r-tibble
  r-tidyr
)
checkdepends=(
  r-ggplot2
  r-iranges
  r-testthat
)
optdepends=(
  r-covr
  r-ggplot2
  r-iranges
  r-knitr
  r-maps
  r-qdapdictionaries
  r-readr
  r-rmarkdown
  r-rvest
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d472d77dec7889760a9323a90aacc89e')
b2sums=('ff0cf054f08099bca90b1a54e6238e5811963f73c98526d6aed76172b7c5728103e5aa72a6d913a8ce5c6db223f0a4e989a814a6d7996b0c536d65ce2442b085')

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
