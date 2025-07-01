# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=txdbmaker
_pkgver=1.4.2
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
md5sums=('5f78e3991369ce8e5cc868069550f40a')
b2sums=('654e6310cbd9bf4514a0e61fe0b1c31fe1b61472a6962d5319be8741029db1104f1b05d595b1d52ce67a01cff27d06e9463558defcc4bf0f91183dc787cc78bd')

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
