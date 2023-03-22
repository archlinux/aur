# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Robert Greener <me@r0bert.dev>

_cranname=mockr
_cranver=0.2.1
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Mocking in R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(r-rlang r-withr)
optdepends=(
    r-covr
    r-fs
    r-knitr
    r-pkgload
    r-rmarkdown
    r-testthat
    r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("23ef5941eeed6a20b7670e78ef54a406ecd1eb9b57da2d4ca92ae03696f27a58")

build() {
  mkdir -p build
  R CMD INSTALL "${_cranname}" -l "${srcdir}/build"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"

  cp -a --no-preserve=ownership "build/${_cranname}" "${pkgdir}/usr/lib/R/library"
}
