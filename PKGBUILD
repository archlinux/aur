# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=breakaway
_pkgver=4.8.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Species Richness Estimation and Modeling"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r-ggplot2
  r-lme4
  r-magrittr
  r-phyloseq
  r-tibble
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-devtools
  r-dplyr
  r-knitr
  r-plyr
  r-rcurl
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('94225c9f1d159e31704079beda962469')
sha256sums=('75d83169f1c3945b3e63a714b0e193512baae0e1ff2e93fec22aa6d302b9bd22')

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
}
