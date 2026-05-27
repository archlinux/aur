# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=assorthead
_pkgver=1.6.3
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
md5sums=('0900a80795ea2dbc2bdb97e85b80e693')
b2sums=('b51e657b451a9009505ccd774c80b246d10ffd2bc88c377e6cea1127a507b70980db46e172b79eaa7d7af0279ae5401a84314b51961e0d0a70ba3cd155f0f093')

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
