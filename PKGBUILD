# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DCATS
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differential Composition Analysis Transformed by a Similarity matrix"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-aod
  r-e1071
  r-matrixstats
  r-mcmcpack
  r-robustbase
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-seurat
  r-seuratobject
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8e3c3bd1ec6a0808d9e9731ae523a1a1')
b2sums=('7f4a3588ff5b8cac058caf8c599c4fe6d6e45c049b54fcbe81afbf2ec931afe5d1ad47d5d802714c6f5fab111db15302f001ef72010e199c39d2daf7da068efc')

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
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
