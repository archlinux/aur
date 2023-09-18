# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fixest
_pkgver=0.11.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Fixed-Effects Estimations"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-dreamerr
  r-numderiv
  r-rcpp
  r-sandwich
)
checkdepends=(
  r-data.table
)
optdepends=(
  r-data.table
  r-ggplot2
  r-knitr
  r-lfe
  r-pander
  r-pdftools
  r-plm
  r-rmarkdown
  r-tinytex
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bac798f161856e3faab38b599132754c')
sha256sums=('13fce103daeba66c3960aa6589eb948b9166c467dc91be2ec1bfe953d30fe7e0')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla fixest_tests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
