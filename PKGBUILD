# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=CGEN
_pkgver=3.38.0
pkgname=r-${_pkgname,,}
pkgver=3.38.0
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
sha256sums=('3609d6ff835c871cbcc497f1e846c6aede3e2d916fe7c6eb14701a313fef5e14'
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
