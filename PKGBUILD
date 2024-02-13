# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccrepe
_pkgver=1.38.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ccrepe_and_nc.score"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-infotheo
)
optdepends=(
  r-biocgenerics
  r-biocstyle
  r-knitr
  r-runit
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('151d956c2fbdaaf64fccbea7f4905a2d')
b2sums=('21fca62d04c74957d32475fa0a66a80a3622e82ac5769de875c18a4c6ebdad879de3d12e6a28b7d2f111e173621364a34bf15570a71ffbf1abaa4081f372c16f')

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
