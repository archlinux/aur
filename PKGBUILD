# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggvenn
_pkgver=0.1.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Draw Venn Diagram by 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-dplyr
  r-ggplot2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eb81af74065bc4f88778e8f88b7bbd8e')
b2sums=('ea06a3d2c90061a1327b43a5f83145fa98413eb6636ce0de941d4eaed30d9a18ff3f2d61bd34b317ff9d07313364c1831185fb2713be6b7169940c509f6d71d1')

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
