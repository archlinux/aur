# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TDbasedUFE
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tensor Decomposition Based Unsupervised Feature Extraction"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-genomicranges
  r-mofadata
  r-readr
  r-rtensor
  r-shiny
  r-tximport
  r-tximportdata
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b31ff6622ec70e9d12e14caffb14f7bc')
b2sums=('143c85e835d8118d4cf8021abf691684fc5cefdf25c8e378d56b85398d33bc285d83e5d1c8ee359bacdc73106fc14b31cf7f5c9092d200b431f69ee997233711')

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
