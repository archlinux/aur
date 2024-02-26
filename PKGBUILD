# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=transformr
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Polygon and Path Transformations"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
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
md5sums=('c874d7ab2e7c979c43c89fa6dcbb1f87')
b2sums=('cdd72cd0910e957ba572f59440cee897a8f99b4969d50b7c3f41bd59279b9b3d858eefd43e0737c3a26ef9322a481b270cea4fc7cbd89f4c2a7f20c53d864a1e')

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
