# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=zlibbioc
_bcver=1.52.0
pkgname=r-${_bcname,,}
pkgdesc="An R packaged zlib-1.2.5"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("Artistic-2.0")
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=("r")
optdepends=("r-biocstyle")

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("8447845b3a9149afc4e21fb51ddc25f83534c930dafbafa831ff0ec83ad61f42f9ed6bef5b9b3b8e1938995893741d5a76b7f9839ab2880ba3efdec73e129998")

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
