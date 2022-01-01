# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_cranname=websocket
_cranver=1.4.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="'WebSocket' Client Library"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL2)
depends=(openssl r-r6 r-later)
makedepends=(r-cpp11 r-asioheaders)
checkdepends=(r-httpuv r-testthat)
optdepends=(
    r-httpuv
    r-testthat
    r-knitr
    r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('281fa0e5d8739ef90626117c8d5ca9e30c7aeb642346d16706cbca34a46749cf')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

check() {
  cd "${_cranname}/tests"
  R_LIBS="${srcdir}/build" NOT_CRAN=true R --vanilla -q -f testthat.R
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
