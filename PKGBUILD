# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.base
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Save Bioconductor Objects to File"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-alabaster.schemas
  r-jsonlite
  r-jsonvalidate
  r-rcpp
  r-rhdf5
  r-s4vectors
  zlib
)
makedepends=(
  r-rhdf5lib
  r-assorthead
)
_checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-digest
  r-knitr
  r-rmarkdown
  r-testthat
  r-alabaster.matrix
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5dbc1d6fc0220666a4ea80e728d19149')
b2sums=('ff01bafc4a528804505e142c7eade9e7fc196c32a69184d1fd28781d7fffc2291505de7ecbb0c743bb52e2f939b8b37c1089721c8115d17ce67357ede31699e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

_check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
