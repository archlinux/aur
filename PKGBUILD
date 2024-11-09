# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=escheR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unified multi-dimensional visualizations with Gestalt principles"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
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
  r-hexbin
  r-knitr
  r-rmarkdown
  r-scater
  r-scran
  r-scuttle
  r-seurat
  r-stexampledata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3980a08dda22b12c250f35ad9c738ce6')
b2sums=('4aca2a586d874724eca3e5fb9c8ee542af73908fd1a62db459bfd49a5518a27c076f7c9fda23ea81f77cd9b45a5f3e596319d16c745f2c0e554e8de36d257deb')

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
