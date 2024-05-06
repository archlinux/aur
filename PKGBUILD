# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EasyCellType
_pkgver=1.6.0
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
md5sums=('b0a96ca60d24f2b1bfd56862a5d864b1')
b2sums=('40d73d194e3fad508e0a9be6d88f637a8530ef83e4c7ec84c1e625f0fbadca8c646204557892069e3af8683ebd2d813bb3518a3f11ce256195892ba66fc2ff62')

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
