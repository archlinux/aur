# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=zlibbioc
_bcver=1.48.0
pkgname=r-${_bcname,,}
pkgdesc="An R packaged zlib-1.2.5"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic2.0)
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=("r")
optdepends=("r-biocstyle")

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("f89833655a32effd80a29914ef3e64c6b38461dffb3a1b6a4351975d28f2a3ca47e3934e6656f53220347005007e45e92121d7d3500279a293159d00efd3c465")

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
