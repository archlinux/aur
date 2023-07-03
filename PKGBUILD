# Maintainer: peippo <christoph+aur@christophfink.com>

_bcname=BSgenome.Hsapiens.NCBI.GRCh38
_bcver=1.3.1000
pkgname="r-${_bcname,,}"
pkgver="${_bcver//[:-]/.}"
pkgrel=3
pkgdesc="Full genome sequences for Homo sapiens (GRCh38)"
arch=("any")
url="https://bioconductor.org/packages/release/data/annotation/html/${_bcname}.html"
license=("Artistic2.0")
depends=(
    "r"
	"r-bsgenome>=1.33.5"
)

source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("db497e7de36335b0d5716ffef6082e1f6e147557c9743362d0d7c59da17fb974521b59bff1ae65f1f16e8d146e5baf6c130a9536565d1384d00347b21034601a")

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
