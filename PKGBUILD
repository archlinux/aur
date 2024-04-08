# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>


_bcname=Rhtslib
_bcver=2.4.1
pkgname=r-${_bcname,,}
pkgdesc="HTSlib high-throughput sequencing library as an R package"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("LGPL-2.0-or-later")
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
b2sums=("003d61f9455981794724ab4e65eaf7f557d2bd394b58ba4e61eb895fbceb8117cb8a8fc6b99f7be71f2ec1b1641ea71867c6a083deba29991c630716de48e82c")

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
