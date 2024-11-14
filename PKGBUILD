# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=DelayedArray
_bcver=0.32.0

pkgname=r-${_bcname,,}
pkgdesc="A unified framework for working transparently with on-disk and in-memory array-like datasets"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
license=("Artistic-2.0")

depends=(
    "r>=4.0.0"
    "r-biocgenerics>=0.43.4"
    "r-iranges>=2.17.3"
    "r-matrixgenerics>=1.1.3"
    "r-s4arrays>=1.1.1"
    "r-s4vectors>=0.27.2"
    "r-sparsearray>=1.1.10"
)
optdepends=(
    "r-airway"
    "r-biocparallel"
    "r-biocstyle"
    "r-delayedmatrixstats"
    "r-genefilter"
    "r-hdf5array>=1.17.12"
    "r-knitr"
    "r-lobstr"
    "r-rmarkdown"
    "r-runit"
    "r-summarizedexperiment"
)

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("9068963c5fa1707580d5a2f6aa5dc455371a0b1f580cb59d79b410ce4848abb2dc896c4c478d67b7e0fbfec33f09841dab990548359b1117b9b1eb13a8a6e50f")

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
