# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=STexampleData
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collection of spatial transcriptomics datasets in SpatialExperiment Bioconductor format"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-experimenthub
  r-singlecellexperiment
  r-spatialexperiment
)
optdepends=(
  r-biocstyle
  r-bumpymatrix
  r-hdf5array
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('faa0c57de6a2d5e1f9fdd6743635a870')
b2sums=('a0d0c8837bbfa3bc5c315ddd133f01160d1746e1919ee001b0bbde8410f626c70879eb3a993ac6da824a6ad6f646fcf548a69e20785a7abdac413cfd9e7ac3be')

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
