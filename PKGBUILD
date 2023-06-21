# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_bcname=MatrixGenerics
_bcver=1.12.2
pkgname=r-${_bcname,,}
pkgdesc="S4 Generic Summary Statistic Functions that Operate on Matrix-Like Objects"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
pkgver=${_bcver//[:-]/.}
pkgrel=2

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
b2sums=("d6c496f4bbb3dbb34bea9ac080c834336f90e0d22347754af53ab84443a8d6533e04381c5d23699cb6d74597656f8425b84199f228648d355eedcb84590d9492")

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
