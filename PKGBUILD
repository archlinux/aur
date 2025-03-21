# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EasyCellType
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotate cell types for scRNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biocstyle
  r-clusterprofiler
  r-dplyr
  r-forcats
  r-ggplot2
  r-magrittr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rlang
  r-vctrs
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocmanager
  r-devtools
  r-knitr
  r-rmarkdown
  r-seurat
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0f729cb62a1682ad1e0d282612989734')
b2sums=('0bdfcde3caffe61802d57ce0d7c0b81866020c6dd95ed8af611ef6f18f29cf81cbc8c5d5a6a82c747b80f8e6b34784f13b2271dd7d7232363a328ae9e60d5a9c')

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
