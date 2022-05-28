# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=future
_cranver=1.26.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Unified Parallel and Distributed Processing in R for Everyone"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(LGPL)
depends=(
    r-digest
    r-globals
    r-listenv
    r-parallelly
)
optdepends=(r-rhpcblasctl r-r.rsp r-markdown)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('a35c0bdae86265ebe86119231802b6fbf7b1d533b57cb423d8483fbe779390d5')

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
