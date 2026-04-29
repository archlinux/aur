# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccrepe
_pkgver=1.47.0
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
md5sums=('b924d3088d6e4410545499bf955f45d3')
b2sums=('6458ad2f52bade0b2131b5545e25a8add79805e59dfbef8b04988872dd2fadf4ad2ccc375a577d21ea9f1cbf251e837aab494dd7a38e1aa83c1b10b0b9c5788b')

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
