# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=STexampleData
_pkgver=1.11.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collection of spatially-resolved transcriptomics datasets in SpatialExperiment Bioconductor format"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-experimenthub
  r-spatialexperiment
)
optdepends=(
  r-biocstyle
  r-bumpymatrix
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ad7f67e1ef3bedcc15e983bdeac2f4dd')
b2sums=('597d71e8bf8fa6897f33f83c1014556de0115cff63a4340686ce8401452eb6a66ffcbc1adb4b7c920904c65e16def31468ceca37194f78e7f08949b77d1b1d3b')

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
