# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=ShortRead
_bcver=1.58.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="FASTQ input and manipulation"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic2.0)
depends=(
    "r"
    "r-biobase"
    "r-biocgenerics>=0.23.3"
    "r-biocparallel"
    "r-biostrings>=2.47.6"
    "r-genomeinfodb>=1.15.2"
    "r-genomicalignments>=1.15.6"
    "r-genomicranges>=1.31.8"
    "r-hwriter"
    "r-iranges>=2.13.12"
    "r-lattice"
    "r-latticeextra"
    "r-rhtslib"
    "r-rsamtools>=1.31.2"
    "r-s4vectors>=0.17.25"
    "r-xvector"
    "r-zlibbioc"
)
optdepends=(
    "r-biocstyle"
    "r-biomart"
    "r-genomicfeatures"
    "r-runit"
    "r-yeastnagalakshmi"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=('caa0d44f60775a54560675cb44283f55fc2a8dbf013b8d26cc69354e233e4b00b996b4471b2cb7dcc8dc6a98c2e22d8747b4221698078442e7980a3665ca05a4')

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
