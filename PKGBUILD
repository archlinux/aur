# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=ggvenn
_pkgver=0.1.10
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Draw Venn Diagram by 'ggplot2'"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-dplyr
  r-ggplot2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('eb81af74065bc4f88778e8f88b7bbd8e')
sha256sums=('cde116f117266cca27d8cd20205512e602c23514db6d97caaa950b9b21fa873e')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
