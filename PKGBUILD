# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=UCSC.utils
_pkgver=1.4.0
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
md5sums=('09f372de865600d96885830f78570b6b')
b2sums=('c2002a9745b4af019ca51970451bb35925879888419afc0105a859365dbb852a7b0509fa8deaa43d7124632aad58c5ea3f9ec8c1f6abcfdee1d9360d67d9bc12')

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
