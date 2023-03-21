# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_bcname=MatrixGenerics
_bcver=1.10.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="S4 Generic Summary Statistic Functions that Operate on Matrix-Like Objects"
arch=(any)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic2.0)
depends=(
    "r"
    "r-matrixstats>=0.60.1"
)
optdepends=(
    "r-matrix"
    "r-sparsematrixstats"
    "r-delayedmatrixstats"
    "r-summarizedexperiment"
    "r-testthat>=2.1.0"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=('598942b007c8e64ae7136f43773cfa5b75bc78294197ba79e4480c54293d3adc4cb0a4caea6763191f11a81e8074271bc365d1979d52a7a7a73d79a7da19cad2')

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
