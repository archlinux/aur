# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=QTLExperiment
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="S4 classes for QTL summary statistics and metadata"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
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
md5sums=('fe7642e0952c4c68e5417906dfb66fb3')
sha256sums=('9d216fb41c637fa3118d42f4475638fab0f5d3a3b6e1e1ecf6244d78388ecc74')

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
