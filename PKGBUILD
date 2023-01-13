# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=mapproj
_cranver=1.2.11
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Map Projections"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(custom:LPL)
depends=(r-maps)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('db2d201cc939de26717566066bf44225a967ccde6fc34731af845f03c086347d')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 "${_cranname}/LICENSE.note" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.note"
}
