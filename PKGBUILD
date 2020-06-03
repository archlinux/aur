# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=pkgload
_cranver=1.1.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Simulate Package Installation and Attach"
arch=(i686 x86_64)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=(r r-cli r-crayon r-desc r-pkgbuild r-rlang r-rprojroot r-rstudioapi r-withr)
makedepends=(gcc)
optdepends=(r-bitops r-covr r-rcpp r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('8522b5fdd3fa1d802c3187f10e24ef40')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
