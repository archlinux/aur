# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_bcname=MatrixGenerics
_bcver=1.18.0
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
b2sums=("faa963f2471bbb7a0d274246de9a667d8648f08d7921b3d236ffedfb9936ff601feeba5e5ac988d6ef7d115bd9a97aeac49849514762c7fc546383bf168a1991")

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
