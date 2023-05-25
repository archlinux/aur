# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=gifski
_cranver=1.12.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Highest Quality GIF Encoder"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r)
makedepends=(rust)
optdepends=(r-ggplot2 r-gapminder)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('f8741330bbd14d8191acdbfdefe80d89ac5f81021bad95868b3cc33cd9dc6416')

build() {
  mkdir -p build
  R CMD INSTALL "$_cranname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_cranname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_cranname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
