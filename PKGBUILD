# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=transformr
_pkgver=0.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Polygon and Path Transformations"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(MIT)
depends=(
  r-lpsolve
  r-rlang
  r-sf
  r-tweenr
  r-vctrs
)
makedepends=(
  r-cpp11
)
optdepends=(
  r-covr
  r-magrittr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('94b6d03d1bd089fa3dc47de6dac69d90')
sha256sums=('c193bc8217c2483933df91863892743f8b5fb03d309df7cd2b6c76e9b1661f40')

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
