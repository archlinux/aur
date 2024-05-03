# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=txdbmaker
_pkgver=1.0.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for making TxDb objects from genomic annotations"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocio
  r-biomart
  r-dbi
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-httr
  r-iranges
  r-rjson
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-ucsc.utils
)
checkdepends=(
  r-rmariadb
  r-runit
)
optdepends=(
  r-biocstyle
  r-ensembldb
  r-knitr
  r-mirbase.db
  r-rmariadb
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d2145305fc78518240d1d9cace6478b1')
b2sums=('72f341676a93374d1f77c09a6cef707e54b102b5aea58e097e89144ef1389e3f15d8e051176e9a88a75645079e0da4704da354e5a7b3b7f49cd3b79053769263')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

check() {
  cd "$_pkgname/tests"
  R_LIBS="$srcdir/build" Rscript --vanilla run_unitTests.R
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
