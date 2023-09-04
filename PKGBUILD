# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fgsea
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Fast Gene Set Enrichment Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('3b02276027800535421f38bbe5e83921')
sha256sums=('ffd44dcf4e4a757ae4c79f3df99897a3e126fbca3e54457ace2c8cc923cf1632')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
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
