# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=callr
_cranver=3.4.4
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Call R from R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r 'r-processx>=3.4.0' r-r6)
optdepends=(r-cliapp r-covr r-crayon r-fansi r-pingr r-ps r-rprojroot r-spelling r-testthat r-tibble r-withr)
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('8298603241075f05728affe579b057f2f39bb578688f041d0161a0cd5d25ecc1')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
