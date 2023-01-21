# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=CGEN
_pkgver=3.34.3
pkgname=r-${_pkgname,,}
pkgver=3.34.3
pkgrel=1
pkgdesc="An R package for analysis of case-control studies in genetic epidemiology"
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  'r>=4.0'
   r-mvtnorm
)
optdepends=(
  r-cluster
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix_globals.patch")
sha256sums=('d86366f21a3cff2c9e4eb794afe658a7e4b52e2fcd851161ac2630eb5eab3e6e'
            'a1e9baa3c89b9950209e4832c35856ccb6b660fedb9ddf9c72c2ed0bc552c752')

#prepare() {
#  cd "${srcdir}/${_pkgname}"

  # fix global variables overlap until it will be fixed in upstream
#  patch -Np0 -i "${srcdir}/fix_globals.patch"
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
