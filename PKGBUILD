# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EasyCellType
_pkgver=1.10.0
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
md5sums=('a814048a892261691480b2c3f6d5a095')
b2sums=('8b79bac790611f7a73fa94004c6a43e6306f6d9f20286cf6d692824e1b53c2217f79038360a50b176e1219a2225c2ae3d7a6f762334c7fe988f0b38131d015b3')

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
