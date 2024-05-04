# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=KOdata
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="LINCS Knock-Out Data Package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9c0810c78a07ea63a6477ce40a9560b1')
b2sums=('c82bff81704d2d4326d2feac8079aab8d8bde479d3f4d774507744c36f52a2223ee53a7fb4fdf5fd6e8e273e56f22c1160b18cea464ecd9c6a71ec52c85a6bcb')

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
