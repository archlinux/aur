# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=UCSC.utils
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Low-level utilities to retrieve data from the UCSC Genome Browser"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-httr
  r-jsonlite
  r-s4vectors
)
checkdepends=(
  r-dbi
  r-rmariadb
  r-testthat
)
optdepends=(
  r-biocstyle
  r-dbi
  r-genomeinfodb
  r-knitr
  r-rmariadb
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8056124c97aa7d718d5d1ac616da4045')
b2sums=('189292d91f9f35780d719499ee04c01a7b04c1f4992a465ee992b98917ea09fa141a655e68fa1d1df3acada588150f64c72a9b383baeb01ec1217c497d395c72')

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
