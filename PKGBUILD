# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=callr
_cranver=3.6.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Call R from R"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r 'r-processx>=3.5.0' r-r6)
optdepends=(r-cli r-covr r-crayon r-fansi r-pingr r-ps r-rprojroot r-spelling r-testthat r-tibble r-withr)
source=("http://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('e67b10e744bdf0a68c0004edef65b7cc3365a82860da6ee4b2dac41b033d1a14')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
