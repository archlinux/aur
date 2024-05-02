# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=alabaster.base
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Save Bioconductor Objects To File"
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
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-digest
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('46138cdc2cd234fdad16f8750d9ef7e3')
b2sums=('39210a909f93d05a1c6a3c875ce45c3bc707288d3dc49e97f745ec548676729aa128118d4f940786d5555b6f1fb8cea257350fa4bb5da05c110f4451d028ce1b')

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
