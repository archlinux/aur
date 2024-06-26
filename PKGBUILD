# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=txdbmaker
_pkgver=1.0.1
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
md5sums=('99f13e6f2a81156fc25e7679168fdb0f')
b2sums=('e3bd7c699f5e4480936590ed069dbdc94367689c5acb322190fcd09b92c9dad0cece1c97b583362888e4ed7f047ef7d0b295ffe59be4cae5fcfc2024488bb0db')

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
