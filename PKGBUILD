# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EasyCellType
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotate cell types for scRNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-clusterprofiler
  r-dplyr
  r-forcats
  r-ggplot2
  r-magrittr
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-rlang
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
md5sums=('2db38b4b3cb810c649e74353e02b5e9a')
b2sums=('bc88667dd588cd60dfffc2ed14179c9d1610314a283e8dfdd90d0363f243dbc876a43ff0d8607e9fda42a91cceb11ab28f09996c98f05257562e260c6f7a72b4')

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
