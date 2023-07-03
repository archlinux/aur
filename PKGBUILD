# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>


_bcname=Rhtslib
_bcver=2.2.0
pkgname=r-${_bcname,,}
pkgdesc="HTSlib high-throughput sequencing library as an R package"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("LGPL2.1")
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r"
    "r-zlibbioc"
)
optdepends=(
    "r-knitr"
    "r-markdown"
    "r-biocstyle"
)
makedepends=()

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("17c321829c72d7438c20917d8416364b6763de67b92b02f8f34b5b3b02c8266b08bbde492370636dcfe5476bc3b296a59ce42b45c242f81e00c21285aafc516a")

options=("!lto" "staticlibs")

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
