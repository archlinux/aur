# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=assorthead
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Assorted Header-Only C++ Libraries"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5de0c2fed2be0b74c804358fe2cef70a')
b2sums=('483bc02e3818876e257176c2b92ef9d22387db46c7138c906d09c63b96a84ce512d9211f5d4f138b4cd3cb8a4eb8d80f7e949389a31cbaec887b905f545a3338')

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
