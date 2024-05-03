# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=synapter
_pkgver=2.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Label-free data analysis pipeline for optimal identification and quantitation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biobase
  r-biostrings
  r-cleaver
  r-msnbase
  r-multtest
  r-qvalue
  r-rcolorbrewer
  r-readr
  r-rmarkdown
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-brain
  r-knitr
  r-synapterdata
  r-testthat
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c00cd48c6a474e0c03dad71a5b3a56ea')
b2sums=('25bad73a57c708e053f524afa1f7ca1a9f7886dc28a7c2e749e6ad1f5c2f14afcf4cbab787490d6a15d1460fb4345c3fdd11560c070ad9fe7ee0dbfdafe69d39')

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
