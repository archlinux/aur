# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=gaston
_pkgver=1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Genetic Data Handling (QC, GRM, LD, PCA) & Linear Mixed Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-3.0-only')
depends=(
  r-rcpp
  r-rcppeigen
  r-rcppparallel
)
optdepends=(
  r-knitr
  r-rcppeigen
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('862c863da43091a675b77de347cc1507')
b2sums=('9839890805c7ba883cfef8ffa3b4d3106529b29be3cc6f72c72f6baf97131fa4f15e3a43d18a6346f88a1b93c78b3d4b151f9ef82c046eb7e4a98e38cde6efc3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
