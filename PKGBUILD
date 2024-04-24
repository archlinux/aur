# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gifski
_pkgver=1.12.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Highest Quality GIF Encoder"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
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
b2sums=('bc24f39d2eb80a4604f8b7254333f5631ad54542093c1a101181bc30a6cd8117c6002a2ac91453c600be81fa4d8bfd9e5d46350a02714cf69721b60fbbf12bba')

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
