# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=simpleSeg
_pkgver=1.8.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package to perform simple cell segmentation"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocparallel
  r-cytomapper
  r-ebimage
  r-s4vectors
  r-spatstat.geom
  r-summarizedexperiment
  r-terra
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ec84b426161e40eddcdf53604af8483')
b2sums=('3f10c3469846deb40865c8f01c76351471514694cd69236518f85d9a6f9b112eb11a234f4e6e146d680c3318fdb3704815dc3c16104c420691c6ca29203cc261')

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
