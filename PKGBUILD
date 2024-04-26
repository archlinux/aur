# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=breakaway
_pkgver=4.8.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Species Richness Estimation and Modeling"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
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
b2sums=('07046b4c7c49d0115f1ee237a7748ba78e92a3820efd2bddc792a35aee2d2194f11c35a638e8c74a61622f7a6b3fcbffb6f7c202c9e627658c57b865de4f1d60')

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
}
