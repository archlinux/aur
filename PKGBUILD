# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ore
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R Interface to the Onigmo Regular Expression Library"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('BSD-3-Clause')
depends=(
  r
)
optdepends=(
  r-covr
  r-crayon
  r-rex
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('575068992b7173ed5996899898b390ca')
b2sums=('9c7cb093aede066a777bcc67e698511bc635b82f20989ee2fd0b676425baec03abe7cb897946f5536d431d4350ef57d21772e6a8b89fddbedea3544c10096f3f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENCE" "$pkgdir/usr/share/licenses/$pkgname"
}
