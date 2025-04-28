# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=txdbmaker
_pkgver=1.4.0
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
md5sums=('700016d62f19e26bc675a3d90696e897')
b2sums=('a9a213ae63442df84eb45dff245ff9afa61e85a8203bf13a432ffdd7c0035271bbf01d1b4c440a70afbbca919e5958db55619ad6e02d8f25f4debe20f13da8ff')

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
