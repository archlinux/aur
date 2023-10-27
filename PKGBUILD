# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=escheR
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unified multi-dimensional visualizations with Gestalt principles"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(MIT)
depends=(
  r-ggplot2
  r-rlang
  r-singlecellexperiment
  r-spatialexperiment
  r-summarizedexperiment
)
optdepends=(
  r-biocstyle
  r-bumpymatrix
  r-ggpubr
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-scuttle
  r-seurat
  r-stexampledata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ed2586d2e42f89db85790889863421b8')
sha256sums=('d997b24d8123ce01826c65f7aa09dacd50869d5d3597679dbffc1416da9c6141')

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
