# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=pkgKitten
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Create Simple Packages Which Do not Upset R Package Checks"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-roxygen2
  r-tinytest
  r-whoami
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1c7c4a381191143f9047c7b25a9aac77')
b2sums=('19d62bdab2df3c76b21dc55d3b7a443a6e78fa4bec4e80bf2ced1d14c29ce299e70cc12eee892cf0ddfc333837017be8b475182271cc4879350fc675d42ec5d3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
