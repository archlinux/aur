# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomeInfoDbData
_bcver=1.2.10
pkgname=r-${_bcname,,}
pkgdesc="Species and taxonomy ID look up tables used by GenomeInfoDb"
url="https://bioconductor.org/packages/release/data/annotation/html/${_bcname}.html"
license=(Artistic2.0)
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.5.0"
)

source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("6353865b5c09d72f27069fdfce340f9913dbb2b00801f577789efa45a745ee02064ed952bb838bb72034dbbee3cc5340f99e7eed0323880c1a2b7b3ea0a28ca2")

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
