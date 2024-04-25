# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=updateObject
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Find/fix old serialized S4 instances"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  git
  r-biocgenerics
  r-digest
  r-s4vectors
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-genomicranges
  r-interactionset
  r-knitr
  r-multiassayexperiment
  r-rmarkdown
  r-singlecellexperiment
  r-summarizedexperiment
  r-testthat
  r-timirgen
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0d69cbbcd4bd9c5f31d905a47f6af212')
b2sums=('226d5f51bda4d2fe770aa218f94c8890a37f3ae9bf977ff2507d910cde3e3fa80e95a37a408cc996650f8dc43402a9c2789f519693bf2fe1b6d3c0e6ae286861')

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
