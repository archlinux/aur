# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=speckle
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical methods for analysing single cell RNA-seq data"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(GPL3)
depends=(
  r-edger
  r-ggplot2
  r-limma
  r-seurat
  r-singlecellexperiment
)
checkdepends=(
  r-testthat
  r-vdiffr
)
optdepends=(
  r-biocstyle
  r-cellbench
  r-jsonlite
  r-knitr
  r-patchwork
  r-rmarkdown
  r-scater
  r-statmod
  r-testthat
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4603cad300c83d6e6374e5989b5fe32a')
sha256sums=('7ab4b4cc704042e0f505c3545bc1add88aabec7a63abd947350fd896f593b7df')

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
