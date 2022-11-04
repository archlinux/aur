# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>


_bcname=Rhtslib
_bcver=2.0.0
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
b2sums=('a12733e6d900552b20e8ac9e6bb95d63146ab35dc41bf5e31357795891882333689ca4b8ad94e1007a7c5893c3757c4fb41f0384815c9964d9826b0e2a013bb7')

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
