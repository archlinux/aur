# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HarmonizR
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Handles missing values and makes more data available"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-doparallel
  r-foreach
  r-janitor
  r-limma
  r-plyr
  r-seriation
  r-summarizedexperiment
  r-sva
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6e81c009fe8678273d8091378ae2f8e3')
sha256sums=('9226855ffafdcbdedb160b454e31faa2d368646d90b6c8975ae19ac973c44fbf')

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
