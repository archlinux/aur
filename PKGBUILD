# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fgsea
_pkgver=1.38.0
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
md5sums=('28c46d9d5a638bcdfb3d8a69f274f470')
b2sums=('75ec5671187ca9e238156bcec79b9af9929d56c6559180bc3a67f18f655a6e623131b44ca8732c2a3e7c08ef9f6f7489fcca13fc5130949ed1e3770d9a39894e')

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
