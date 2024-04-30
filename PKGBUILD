# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DGEobj.utils
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Differential Gene Expression (DGE) Analysis Utility Toolkit"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-dgeobj
  r-dplyr
  r-stringr
)
checkdepends=(
  r-biomart
  r-canvasxpress
  r-edger
  r-ggplot2
  r-ihw
  r-limma
  r-qvalue
  r-rnaseqpower
  r-statmod
  r-sva
  r-testthat
  r-zfpkm
)
optdepends=(
  r-biomart
  r-canvasxpress
  r-conflicted
  r-edger
  r-ggplot2
  r-glue
  r-ihw
  r-knitr
  r-limma
  r-qvalue
  r-rmarkdown
  r-rnaseqpower
  r-statmod
  r-sva
  r-testthat
  r-zfpkm
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8acaeb2945ce80bd2f83f88ef365c88f')
b2sums=('6e4b053a97206f595bc13933603b3976d5fccaf1c87211d29ac3ebbb34a58cc6a8d5cdc422d593779d8233c78c98cc33dee5a71db53c946bf33abcc0a54e993a')

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
