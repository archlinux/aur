# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=QTLExperiment
_pkgver=2.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="S4 classes for QTL summary statistics and metadata"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-ashr
  r-biocgenerics
  r-checkmate
  r-collapse
  r-dplyr
  r-rlang
  r-s4vectors
  r-summarizedexperiment
  r-tibble
  r-tidyr
  r-vroom
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-covr
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b2336aa4644bec7ccd0403e3bb366ace')
b2sums=('d4baf3b409a44a120d44fd610ce5d9c0ec946aef3b881c865df2791f67dbd96ba842de2b3349687f9fc63b1335729cf6845e51707cd13eea75f651ee24f55452')

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
