# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=txdbmaker
_pkgver=1.4.1
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
md5sums=('7e8941937549ea914c5f27cddb5be76e')
b2sums=('50f8b9a6be34ff1587a33afdfbd7fd5164b4fc57e7ae8b9f7bd263817238a9243854001ebea100a30dc4e1b1f0f841f69ba153f7edcc2ed54c9bf79105abf003')

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
