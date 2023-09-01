# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=DelayedArray
_bcver=0.26.7

pkgname=r-${_bcname,,}
pkgdesc="A unified framework for working transparently with on-disk and in-memory array-like datasets"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
license=("Artistic2.0")

depends=(
    "r>=4.0.0"
    "r-biocgenerics>=0.43.4"
    "r-matrixgenerics>=1.1.3"
    "r-s4vectors>=0.27.2"
    "r-iranges>=2.17.3"
    "r-s4arrays>=1.0.1"
)
optdepends=(
    "r-biocparallel"
    "r-hdf5array>=1.17.12"
    "r-genefilter"
    "r-summarizedexperiment"
    "r-airway"
    "r-lobstr"
    "r-delayedmatrixstats"
    "r-knitr"
    "r-rmarkdown"
    "r-biocstyle"
    "r-runit"
)

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("7d666d3f3f778b96f5280cff175a5bd93be4b106e31d7879b62987a66a51b20defecf0094bce38e460b2ee42729f61117a3a24b4d1682751e5c4141fc5ee6106")

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
