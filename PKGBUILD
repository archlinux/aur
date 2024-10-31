# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=DCATS
_pkgver=1.4.0
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
md5sums=('de7f2ed5215d0945dcb3c77705cb7394')
b2sums=('3dca33d7bc730c3dd75fd990c32d2b7e65933ecd259fbef6d5e58db1634525881aacfd883146af2455710ffe1f27189c7f8201b751ab11068a5080593136b1ef')

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
