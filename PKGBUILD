# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gifski
_pkgver=1.12.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Highest Quality GIF Encoder"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r
)
makedepends=(
  rust
)
optdepends=(
  r-gapminder
  r-ggplot2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b132e35042ef99534d06d6bd6242a0ca')
sha256sums=('281361b291a8d0df57444918f1d3cb8be404aa5f2749e96d777f884baa037b79')

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
