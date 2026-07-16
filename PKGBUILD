# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=QTLExperiment
_pkgver=2.4.0
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
md5sums=('6eec02c192567f820b4a4e0bf836a4ba')
b2sums=('0e45964c14e8c301f5364701e3cab28058745e120ac2ed320bd2472f9ead737370107cbb0821462f7305cd927c5062f25bf7a5e58e8bd5ea0cf3a9c084a02396')

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
