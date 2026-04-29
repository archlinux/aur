# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gypsum
_pkgver=1.6.0
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
md5sums=('f3dd8f91eaf009e2d554e953522c77c4')
b2sums=('2bc9505005d0f15858478c93bb75ea8d664c7028ff68308f7aa6728c7d8bb957e43b0b4ebadbf1736ce6a58f9befd45de7ee8d7db789b89d9e914ec68963282c')

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
