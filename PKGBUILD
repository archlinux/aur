# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>


_bcname=Rhtslib
_bcver=2.4.0
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
b2sums=('3ac23e12f2f5a59db9b15f7f1789c5b94683b92028a11c35f0215c7797ca0058e252cd3869074a908944a2e853e311f771cbbccb3d6fad5947fbc81aa72881b5')

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
