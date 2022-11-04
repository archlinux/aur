# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=MACPET
_pkgver=1.15.1
pkgname=r-${_pkgname,,}
pkgver=1.15.1
pkgrel=4
pkgdesc='Model based analysis for paired-end data'
arch=('x86_64')
url="https://bioconductor.org/packages/3.15/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-bigmemory
  r-biocparallel
  r-biostrings
  r-futile.logger
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-geoquery
  r-gtools
  r-interactionset
  r-intervals
  r-iranges
  r-knitr
  r-plyr
  r-rbowtie
  r-rcpp
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shortread
)
makedepends=(
  patch
)
optdepends=(
  r-biocstyle
  r-ggplot2
  r-igraph
  r-reshape2
  r-rmarkdown
)
source=("https://bioconductor.org/packages/3.15/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix_dbleps.patch")
sha256sums=('54ff827da7f169b43368d31b6417697ff36a20e464f5fb201de988d7dd88821c'
            '2b22a1d373b9685991d80ea9177e3f085f50c229b995f4ee1be97510fd65632f')

prepare() {
  cd "${srcdir}/${_pkgname}"

  # fix issue with some global macro
  patch -Np0 -i "${srcdir}/fix_dbleps.patch"
}

build() {
  # create staging directory for installation
  mkdir -p "${srcdir}/staged"

  R CMD INSTALL "${_pkgname}" -l "${srcdir}/staged"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${srcdir}/staged/${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
