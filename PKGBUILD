# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fgsea
_pkgver=1.30.0
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
md5sums=('ee0533776cc2027d55f81c5dca569464')
b2sums=('dbad9d4ce98cb10e61cc1036fb6f581c22957a91f43252e1cc98e2c3f827ca80cf447a8945694326804cb0abe0877f4a020ccd818f4f3d4e7435e01c3737e9a7')

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
