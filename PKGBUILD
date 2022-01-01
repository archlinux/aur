# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=AsioHeaders
_cranver=1.16.1-1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="'Asio' C++ Header Files"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(Boost)
depends=(asio r)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('9862ec4849ddb326d346d73247125371c670b5986956b10b39e61017cd46e042')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"

  # devendor header files by linking to 'asio' package
  cd "${pkgdir}/usr/lib/R/library/${_cranname}/include"
  rm -r asio asio.hpp
  install -dm0755 "${pkgdir}/usr/include/asio"
  ln -s /usr/include/asio
  ln -s /usr/include/asio.hpp
}
