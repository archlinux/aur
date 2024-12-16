# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=IRanges
_bcver=2.40.1
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Foundation of integer range manipulation in Bioconductor"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("Artistic-2.0")
depends=(
    "r>=4.0.0"
    "r-biocgenerics>=0.39.2"
    "r-s4vectors>=0.33.3"
)
optdepends=(
    "r-biocstyle"
    "r-bsgenome.celegans.ucsc.ce2"
    "r-genomicalignments"
    "r-genomicfeatures"
    "r-genomicranges"
    "r-pasillabamsubset"
    "r-rsamtools"
    "r-runit"
    "r-xvector"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("0eb6dc5315f2a17a47107d866cc8b215c8914ad87e82c03786def52aff219d3c41f74d7d554b39579ba8da5354783935c2b0e1d3927e3329c82bf8c4e0fbf2f8")

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
