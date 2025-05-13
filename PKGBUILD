# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=QTLExperiment
_pkgver=2.0.1
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
md5sums=('b12d7ef7433a9dde9eba854c840313c2')
b2sums=('0ca85ed2bdb5943ff738842a348510a6c13c69ab3f4e40d0107393b8fe4082703290c0a72690589c25cc5742e4010ea0016b2b14860a64b75ef108de98695bca')

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
