# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DelayedMatrixStats
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions that Apply to Rows and Columns of 'DelayedMatrix' Objects"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-delayedarray
  r-iranges
  r-matrixgenerics
  r-s4vectors
  r-sparsearray
  r-sparsematrixstats
)
optdepends=(
  r-biocstyle
  r-hdf5array
  r-knitr
  r-matrixstats
  r-microbenchmark
  r-profmem
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('52d67c6e3ac42277b94d9ebbb4205638')
b2sums=('f41da235329e64e3d529d24b4d5221624c535a0938a86c49254b90f88ea202e42fba2e639a6306d3f1faa5745e635dc9ca3bea000b7a6ff0db07a7ba30cd8ad1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
