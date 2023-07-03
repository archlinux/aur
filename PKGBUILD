# Maintainer: peippo <christoph+aur@christophfink.com>

_bcname=BSgenome.Scerevisiae.UCSC.sacCer2
_bcver=1.4.0
pkgname="r-${_bcname,,}"
pkgver="${_bcver//[:-]/.}"
pkgrel=3
pkgdesc="Saccharomyces cerevisiae (Yeast) full genome (UCSC version sacCer2)"
arch=("any")
url="https://bioconductor.org/packages/release/data/annotation/html/${_bcname}.html"
license=("Artistic2.0")
depends=(
    "r"
	"r-bsgenome>=1.33.5"
)

source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("fefbe5fcdacea53a40a571214471dcb7003d120a2430ee00155dd1eb32737bddf760c8e833c6b01a34c94996d627d707ccbe657112a497cac3abd41470520064")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_bcname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_bcname}/LICENSE" ]]; then
        install -Dm0644 "${_bcname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
