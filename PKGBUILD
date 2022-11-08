# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=Rsamtools
_bcver=2.14.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Binary alignment (BAM), FASTA, variant call (BCF), and tabix file import"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("Artistic-2.0")
depends=(
    "r>=3.5.0"
    "r-biocgenerics>=0.25.1"
    "r-biocparallel"
    "r-biostrings>=2.47.6"
    "r-bitops"
    "r-genomeinfodb>=1.1.3"
    "r-genomicranges>=1.31.8"
    "r-iranges>=2.13.12"
    "r-rhtslib>=1.99.3"
    "r-s4vectors>=0.17.25"
    "r-xvector>=0.19.7"
    "r-zlibbioc"
)
makedepends=(make)
optdepends=(
    "r-biocstyle"
    "r-bsgenome.hsapiens.ucsc.hg19"
    "r-genomicalignments"
    "r-genomicfeatures"
    "r-rnaseqdata.hnrnpc.bam.chr14"
    "r-runit"
    "r-shortread>=1.19.10"
    "r-txdb.dmelanogaster.ucsc.dm3.ensgene"
    "r-txdb.hsapiens.ucsc.hg18.knowngene"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("434adeaa9f5aad6b7fa7e4422de5bcfc6596c0d150a2b266c2838a28e20da9cfe65cd4dd0972e6d00d7ec746af5e8fc024415e17432edbe71088b4e3902c62dd")

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
