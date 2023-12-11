# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=STexampleData
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collection of spatially-resolved transcriptomics datasets in SpatialExperiment Bioconductor format"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
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
md5sums=('5fa4bfb2e58e7f6bbcd957aa1aa7e938')
sha256sums=('29abd18b6363d77a7effee5e59f02eca94c629f3e430d148e12b2935c80918e6')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
