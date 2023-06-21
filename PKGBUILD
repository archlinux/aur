# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=IRanges
_bcver=2.34.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Foundation of integer range manipulation in Bioconductor"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("Artistic2.0")
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
b2sums=("80033a31e2c8364f98e735bf6448d5f928d46421e31a39360c3f82c2ab855f0afc3c97e88be53c2ed4861e277fee8a222c237a9ba0a7c337479e5d727fa819dd")

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
