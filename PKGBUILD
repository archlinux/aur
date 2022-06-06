# system requirements: liblapack-dev
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_pkgname=networkBMA
_pkgver=2.35.0
pkgname=r-${_pkgname,,}
pkgver=2.35.0
pkgrel=1
pkgdesc='Regression-based network inference using Bayesian Model Averaging'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-bma
  r-leaps
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  lapack
)
makedepends=(
  patch
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz"
        "fix_boostinc.patch")
sha256sums=('a29156b5bcc82d61f512436a96d29d6518a7042a684c3cd335795d754e5a4075'
            'fe3b4f88661542b0053dc01af9755514e1f889166a68dd1735df29d7e459cfbf')

prepare() {
  cd "${srcdir}/${_pkgname}"

  # fix issue with missing Boost header inclusion
  patch -Np0 -i "${srcdir}/fix_boostinc.patch"
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
