# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=rcmdcheck
_cranver=1.4.0
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Run 'R CMD check' from 'R' and Capture Results"
arch=(any)
url="https://cran.r-project.org/package=${_cranname}"
license=(MIT)
depends=(r 'r-callr>=3.1.1.9000' 'r-cli>=3.0.0' r-curl 'r-desc>=1.2.0' r-digest r-pkgbuild r-prettyunits r-r6 r-rprojroot 'r-sessioninfo>=1.1.1' r-withr r-xopen)
optdepends=(r-covr r-knitr r-mockery r-rmarkdown r-testthat)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('bbd4ef7d514b8c2076196a7c4a6041d34623d55fbe73f2771758ce61fd32c9d0')

build() {
  cd "${srcdir}"

  R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l ${srcdir}
}

package() {
  cd "${srcdir}"

  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"
}
