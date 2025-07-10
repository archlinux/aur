# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fuzzyjoin
_pkgver=0.1.6.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('7100abbf42563ea0476f05488325c082')
b2sums=('f3f22d13f1f26debdb4cffeee9ed06a8fd02eb22967009e4eedfc5bc9cdc0db4a94db353298ba2dc556465fc2b88643b9f0b2da67bb00a954a64557c4126736d')

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
