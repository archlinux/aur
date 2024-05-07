# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=IRanges
_bcver=2.38.0
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
b2sums=("3ae9be65ebbd105d5309288eb4a21525baf3f2add31973f4a433d685c499a8cb932ce43bc4e6aa23268520b3cb342efbc91243ff760de18c25a40f75df28d54b")

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
