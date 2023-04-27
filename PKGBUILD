# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=kebabs
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='Kernel-Based Analysis Of Biological Sequences'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-apcluster
  r-biostrings
  r-e1071
  r-iranges
  r-kernlab
  r-liblinear
  r-rcpp
  r-s4vectors
  r-xvector
)
makedepends=(
  patch
)
optdepends=(
  r-biobase
  r-biocgenerics
  r-knitr
  r-sparsem
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix_strictrhdrs.patch")
sha256sums=('e70f9d0dae1fce57933ba0feed6760cf514a641971218c746d4f66eb5e5fdd9e'
            'ee468bac3f162ee1d3a23ad59fb8ea5a050e03eb9a96d35950e16fbadc1b95ee')

#prepare() {
#  cd "${srcdir}/${_pkgname}"

  # fix issues with transition to the strict R headers
#  patch -Np0 -i "${srcdir}/fix_strictrhdrs.patch"
#}

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
