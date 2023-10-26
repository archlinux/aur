# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=synapter
_pkgver=2.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Label-free data analysis pipeline for optimal identification and quantitation"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL2)
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
sha256sums=('03cd1fb5c89df4c1bcb5f6937086fa07a76d04a89023854bf42344ab95379f31')

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
