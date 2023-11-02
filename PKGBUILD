# Maintiner: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=Biobase
_bcver=2.62.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Biobase: Base functions for Bioconductor"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic2.0)
depends=(
    "r>=2.10"
    "r-biocgenerics>=0.27.1"
)
optdepends=(
    "r-all"
    "r-biocstyle"
    "r-golubesets"
    "r-knitr"
    "r-runit"
    "r-tkwidgets"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("713baaea0bf34b8ab230cc101f4304b00e34bb4588efde71a860016e58d56f20f2dd5592df6731ffc5e2f85130ea50e08fdb26b1a5023e4d7d87928aeaa35174")

build(){
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"

  if [[ -f "${_bcname}/LICENSE" ]]; then
    install -Dm0644 "${_bcname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
