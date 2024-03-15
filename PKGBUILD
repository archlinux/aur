# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RITANdata
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('12987879ef374ad399dd440a058b9a47')
b2sums=('bfd981e697b3c803e5b2fbd08a7eb86b46fb0d680a78e3a03285f592f0b4bb319dd5c4f62f0ea4f6a7d125bed9c9bf70468738303f6c5f299c733e7508d84ffc')

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
