# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=gifski
_pkgver=1.32.0-1
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
md5sums=('42679b0644126790acfb5fe6274d767f')
b2sums=('d27b65c869cb87f295735c1ec47dd1606c52ae0001406d69fac6f3de69685e0f8b02696177a2b164664c5ecab14c027657e6e0bbfd2bb1f048c40aa558adbdac')

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
