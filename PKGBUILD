# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TDbasedUFE
_pkgver=1.8.0
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
md5sums=('4da4e089c764dfd3bafbfa9ad2da7fb2')
b2sums=('979ba84c74e64e92796741bb44b111781f08d3b10905ea9718e81e87545afc012960d721ce7b4185fd3f3d99381e36212f255f0b81608baaaca821896a63281a')

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
