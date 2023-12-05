# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DGEobj.utils
_pkgver=1.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differential Gene Expression (DGE) Analysis Utility Toolkit"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
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
sha256sums=('734c961fcb346643707e693825b4d6d5f1ee4fea4c9bb952d5d1ab2dccf7eb06')

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
}
