# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gifski
_pkgver=1.32.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('d896c5bb7389dea0ceb29ce1814bcf89')
b2sums=('ae650b9f29e8a4d6b022232b7b13a97c419830ff063f39f84810d7d135495bbfcf18c1380f32e76fc1c0e54758bcafa54a0ff37259493488ae970f43514a2791')

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
