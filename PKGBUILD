# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gypsum
_pkgver=1.2.0
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
md5sums=('9d2f3c483225865a0bf4639fee72cd03')
b2sums=('63b87d3f4aec58210db84748b1bef1648a79a2b9c435c4e2ccaed5c20f4ebffe403141b60f8001c51ee7dc26e2afc2eafb0d6395eeed209619d30adb26e0182f')

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
