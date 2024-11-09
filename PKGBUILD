# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TENxVisiumData
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visium spatial gene expression data by 10X Genomics"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-experimenthub
  r-spatialexperiment
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('51c4de649c20eb710f34c5e6803f98ed')
b2sums=('3b9b590ef5e44bd1cfce24adc4c8fd0545be4cf5e0d0a42adbf214f23563e2fd930532cb25e4229c5414ca96fa9b02ac39ede88942405319e496b0fe9a9837d6')

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
