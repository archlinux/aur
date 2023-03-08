# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomeInfoDb
_bcver=1.34.9
pkgname="r-${_bcname,,}"
pkgver="${_bcver//[:-]/.}"
pkgrel=1
pkgdesc="Utilities for manipulating chromosome names, including modifying them to follow a particular naming style"
arch=("any")
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("Artistic2.0")
depends=(
    "r>=4.0.0"
	"r-biocgenerics>=0.37.0"
	"r-s4vectors>=0.25.12"
	"r-iranges>=2.13.12"
	"r-rcurl"
	"r-genomeinfodbdata"
)
optdepends=(
    "r-genomicranges"
    "r-rsamtools"
    "r-genomicalignments"
    "r-genomicfeatures"
    "r-txdb.dmelanogaster.ucsc.dm3.ensgene"
    "r-bsgenome"
    "r-bsgenome.scerevisiae.ucsc.saccer2"
    "r-bsgenome.celegans.ucsc.ce2"
    "r-bsgenome.hsapiens.ncbi.grch38"
    "r-runit"
    "r-biocstyle"
    "r-knitr"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=('d6e3e86125cc3f5e1ac703a75cee215da5da74321729a4b0b9956883049ca61a5bd1f104809c895ebb13aae75618b2d644607a63a779388d54443a738c9a9afd')

build() {
  R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"

  if [[ -f "${_cranname}/LICENSE" ]]; then
    install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi

}
