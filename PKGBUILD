# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EasyCellType
_pkgver=1.13.0
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
md5sums=('3f5cf728af83b2b7d0e684dcbf2e1268')
b2sums=('ac91baaf94900de013f43e196b0df5b7a99370e8fc60a1a21b22790353853d966cbbd92dd860cf895bcbc6d78bef2a161c4923da0fa23e2587fc6dbbd749b04c')

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
