# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=synapter
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('a6c9ade32fbe35d5cb85adc0e9a5322c')
b2sums=('01f2aea807a90f0b24efc047d7394e96fc875dc6daa79ddc5d98ab151b4b4141b0c41c7d157a09aeb91aa28f3c436157b6754101818e83d93e3df1b027d1d45e')

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
