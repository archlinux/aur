# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fuzzyjoin
_pkgver=0.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Join Tables Together on Inexact Matching"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
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
sha256sums=('47eaefb73ce8553301e15359bc0e071222fc463c334ca486fa04c68d3e86b968')

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
