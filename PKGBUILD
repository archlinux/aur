# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=Rsamtools
_bcver=2.12.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=2
pkgdesc="Binary alignment (BAM), FASTA, variant call (BCF), and tabix file import"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("Artistic-2.0")
depends=(
    "r>=3.5.0"
    "r-biocgenerics>=0.25.1"
    r-biocparallel
    "r-biostrings>=2.47.6"
    r-bitops
    "r-genomeinfodb>=1.1.3"
    "r-genomicranges>=1.31.8"
    "r-iranges>=2.13.12"
    "r-rhtslib>=1.17.7"
    "r-s4vectors>=0.17.25"
    "r-xvector>=0.19.7"
    r-zlibbioc
)
makedepends=(make)
optdepends=(
    r-biocstyle
    r-bsgenome.hsapiens.ucsc.hg19
    r-genomicalignments
    r-genomicfeatures
    r-rnaseqdata.hnrnpc.bam.chr14
    r-runit
    "r-shortread>=1.19.10"
    r-txdb.dmelanogaster.ucsc.dm3.ensgene
    r-txdb.hsapiens.ucsc.hg18.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
#source=("https://bioconductor.org/packages/3.14/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('20e860c61ef66f8e61f8de7f77c4a244439c8fe39286d080cd580417073894f2')

options=(!lto !buildflags staticlibs)

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
