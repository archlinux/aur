# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=shinyLP
_pkgver=1.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Bootstrap Landing Home Pages for Shiny Applications"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-shiny
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9acf37706bb3415f16ab038e9a04a3f2')
b2sums=('f445f9c7e6bfd787126f696acc44b9ed64c7dd6ae0619145b679e988a4e95e53d90733a114a6ed6e9ba8953e42715e74f0252129e195b761730edd83efbd34e4')

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
