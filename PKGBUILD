# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=DelayedArray
_bcver=0.28.0

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
b2sums=('09f14849b69bb27be6e3a99f9e466ecb65b70f6de2732c70a6b18ed24d6f9f6366b17e0131b0a1af91b9069c86671fcfdd4590940880a78fe6ff68ef333b15ec')

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
