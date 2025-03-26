# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=STexampleData
_pkgver=1.14.3
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
md5sums=('008ef81d1a5ee91abf7a4171d301a73d')
b2sums=('7ec32c1e9283d095d722b778f512c59f017fa631df64cc3d854cb8dbcb0c2b9a39c299b4e166e2625ddf79c9c93ee189ae80bde9bbe430cf895d499456b0e50e')

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
