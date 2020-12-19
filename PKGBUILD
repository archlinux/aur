# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=pkgbuild
_cranver=1.2.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Find Tools Needed to Build R Packages"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
depends=('r>=3.1' 'r-callr>=3.2.0' r-cli r-crayon r-desc r-prettyunits r-r6 r-rprojroot 'r-withr>=2.1.2')
optdepends=(r-rcpp r-cpp11 r-testthat r-covr)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('2e19308d3271fefd5e118c6d132d6a2511253b903620b5417892c72d2010a963')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
