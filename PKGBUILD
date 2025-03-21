# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=STexampleData
_pkgver=1.14.2
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
md5sums=('72d28d5d82ef4e0a2bf05bb265028e55')
b2sums=('e5dd1c86fb49f2b80fbdaf39a279af0b4e4b9cb152d680e9fe1ab0768c3083d819e3e430f03907a2c713397c14a8f446cc5715849c631dc08a017aaa49fedc66')

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
