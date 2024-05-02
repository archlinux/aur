# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=concordexR
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Calculate the concordex coefficient"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biocparallel
  r-cli
  r-delayedarray
  r-ggplot2
  r-pheatmap
  r-rlang
  r-scales
)
checkdepends=(
  r-biocneighbors
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocneighbors
  r-biocstyle
  r-bluster
  r-covr
  r-knitr
  r-patchwork
  r-rmarkdown
  r-scater
  r-tenxpbmcdata
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('957ceda27725ac78f8ea7a1168023d96')
b2sums=('5b3f2bc4f4138ce2cfa252f20d4030f32836e2eadcfdd822c4c2ac03176ef7f8014c270a25226a63319314e83667e91ea5c223ce76bfae5072fb25b5648ad94f')

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
