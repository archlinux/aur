# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RITANdata
_pkgver=1.38.0
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
md5sums=('0d5e06ab159e8dbafe876da7f927f2bf')
b2sums=('a64e575d171b52b080aadcdc5e86532207fd75510ee2f3e5a5ba7298a5e8decbcf527a49f3c66a6e2157f4a4523286da733b8d2451715faff92387a24247efd7')

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
