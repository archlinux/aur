# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=flowGate
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive Cytometry Gating in R"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocmanager
  r-dplyr
  r-flowcore
  r-flowworkspace
  r-ggcyto
  r-ggplot2
  r-purrr
  r-rlang
  r-shiny
  r-tibble
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-stringr
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c28c164156893d0806b8923070a1bb7b')
b2sums=('dddc5066ba341535a77fbb6ffe668b1fad848b09b965352f9e882c238a29a50ca9c5ee61c3322e4d969fac9d9a13c337e611be283dcae8015a8e51c646d43543')

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
