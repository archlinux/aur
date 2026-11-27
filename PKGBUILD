# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=TENxVisiumData
_pkgver=1.22.0
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
md5sums=('02be2ceee90d200b94ed84b6cd700c8d')
b2sums=('011c538c1d17f504335fbdd4a3e9f19fd7df0b22d64094014dc050b44d8cbcf0b485ef01357a8a41535e745d79f9e31d63948dff70b2e40a443cb08ca10e9dc6')

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
