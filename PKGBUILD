# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=synapter
_pkgver=2.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('0a1b7bdc0e115bb14644630fdbb324ef')
sha256sums=('dcb7f2ce5cb223d097d26e83637534cc433388b36e8d40a3bab6afef270f5445')

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
