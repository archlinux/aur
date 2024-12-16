# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomeInfoDbData
_bcver=1.2.13
pkgname=r-${_bcname,,}
pkgdesc="Species and taxonomy ID look up tables used by GenomeInfoDb"
url="https://bioconductor.org/packages/release/data/annotation/html/${_bcname}.html"
license=("Artistic-2.0")
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.5.0"
)

source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("7be940d1132a7744067ebc5ec662d169e19d56eea8459736568985d90add1ec894a39b5ecb68215716bccf9ac50ed0916137e09e4d45034fd9448981672179f7")

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
