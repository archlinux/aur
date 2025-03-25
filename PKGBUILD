# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fgsea
_pkgver=1.32.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Gene Set Enrichment Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-biocparallel
  r-cowplot
  r-data.table
  r-fastmatch
  r-ggplot2
  r-rcpp
  r-scales
)
makedepends=(
  r-bh
)
checkdepends=(
  r-geoquery
  r-limma
  r-reactome.db
  r-testthat
)
optdepends=(
  r-aggregation
  r-annotationdbi
  r-geoquery
  r-knitr
  r-limma
  r-msigdbr
  r-org.mm.eg.db
  r-reactome.db
  r-rmarkdown
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b6b1213d8a49aad32847ea0c41ffb93d')
b2sums=('f71dca4c364c7b897cacac51956743a56a1cd2a4eeba71afae9df8e6d7c46d9a28b2b809e587af979f8ecf1cdb1a2cc036727e1e4b1d03b166ec6a44cd28f6ae')

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
  ln -s "/usr/lib/R/library/$_pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname"
}
