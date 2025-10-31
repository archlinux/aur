# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RITANdata
_pkgver=1.33.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="This package contains reference annotation and network data sets"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fa3d5b254bab91f18674119f79197e6b')
b2sums=('de8635d06cb4ffca8f4363cacc6f5be5650cf23f1a802400409d9de340dce036c23cd451e2dfd9f283b3203c96afbe0e29fff07b5fd3867a120e2ba391316860')

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
