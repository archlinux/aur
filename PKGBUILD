# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gypsum
_pkgver=1.8.0
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
md5sums=('b3fcb0d6007d27dc3075e824d5eae2a8')
b2sums=('8572040be83e4d683b056bd8b133fd88119cd1ac727ad237af0e5302eb3523a8d126465b0ce755a2d98bd7fdcf475d7cb48af09d6d70c3bd0734d848c4605729')

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
