# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=mapproj
_cranver=1.2.9
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Map Projections"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(custom:LPL)
depends=(r-maps)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('da28fab490072e0b2ff5e124092d6b3146e4c01b2386e23a2ea4b0e9fc72df82')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 "${_cranname}/LICENSE.note" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.note"
}
