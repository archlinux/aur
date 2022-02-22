# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=mapproj
_cranver=1.2.8
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Map Projections"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(custom:LPL)
depends=(r-maps)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('865f108f1ee54cda38571b86cd46063a903824d9b4eabfdf75218023d08a7781')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  install -Dm644 "${_cranname}/LICENSE.note" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.note"
}
