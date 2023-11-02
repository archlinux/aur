# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_bcname=MatrixGenerics
_bcver=1.14.0
pkgname=r-${_bcname,,}
pkgdesc="S4 Generic Summary Statistic Functions that Operate on Matrix-Like Objects"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("any")
license=("Artistic2.0")

depends=(
    "r"
    "r-matrixstats>=1.0.0"
)
optdepends=(
    "r-delayedarray"
    "r-delayedmatrixstats"
    "r-sparsearray"
    "r-sparsematrixstats"
    "r-summarizedexperiment"
    "r-testthat>=2.1.0"
)

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=('de9621da52a3a4c6e4bace60b20dddb2182d7560a3db815108dca734f5b18812fe0861e30f7f328c4e44d51157ef1481048d50a2fb424dc1f4731771bb83c613')

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"

  if [[ -f "${_bcname}/LICENSE" ]]; then
    install -Dm0644 "${_bcname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
