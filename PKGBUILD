# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=IRanges
_bcver=2.32.0
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
    "r-xvector"
    "r-genomicranges"
    "r-rsamtools"
    "r-genomicalignments"
    "r-genomicfeatures"
    "r-bsgenome.celegans.ucsc.ce2"
    "r-pasillabamsubset"
    "r-runit"
    "r-biocstyle"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=('ae7fb953077f516f55d2b60d7944355a3672d8f33e9957ba4c8d7188bb943fce3e141c990f43cb252baa5c7e4826d21cf71ec0e62bed5df2ef38da3258222b92')

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
