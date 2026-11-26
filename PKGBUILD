# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gypsum
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to the gypsum REST API"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-filelock
  r-httr2
  r-jsonlite
  r-rappdirs
)
checkdepends=(
  r-dbi
  r-jsonvalidate
  r-rsqlite
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dbi
  r-digest
  r-jsonvalidate
  r-knitr
  r-rmarkdown
  r-rsqlite
  r-s4vectors
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9489ef9d4af75b553b9fa106217f7dec')
b2sums=('55e3fe58692c489c44aabfc75142e89e40a1d4de5cde7495c451033f32b6b4ee5325d3304543f65875376b97668d92c95ae98b51d32d4148589694d5be711315')

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

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
