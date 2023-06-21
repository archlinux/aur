# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomicRanges
_bcver=1.52.0

pkgname=r-${_bcname,,}
pkgdesc="Representation and manipulation of genomic intervals"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
pkgver=${_bcver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
license=("Artistic2.0")

depends=(
    "r>=4.0.0"
    "r-biocgenerics>=0.37.0"
    "r-s4vectors>=0.27.12"
    "r-iranges>=2.31.2"
    "r-genomeinfodb>=1.15.2"
    "r-xvector>=0.29.2"
)
optdepends=(
    "r-annotate"
    "r-annotationdbi"
    "r-annotationhub"
    "r-biobase"
    "r-biocstyle"
    "r-biostrings>=2.25.3"
    "r-bsgenome"
    "r-bsgenome.hsapiens.ucsc.hg19"
    "r-bsgenome.mmusculus.ucsc.mm10"
    "r-bsgenome.scerevisiae.ucsc.saccer2"
    "r-deseq2"
    "r-dexseq"
    "r-digest"
    "r-edger"
    "r-genomicalignments"
    "r-genomicfeatures"
    "r-gviz"
    "r-hgu95av2.db"
    "r-hgu95av2probe"
    "r-kegggraph"
    "r-keggrest"
    "r-knitr"
    "r-pasillabamsubset"
    "r-rmarkdown"
    "r-rnaseqdata.hnrnpc.bam.chr14"
    "r-rsamtools>=1.13.53"
    "r-rtracklayer"
    "r-runit"
    "r-summarizedexperiment>=0.1.5"
    "r-txdb.athaliana.biomart.plantsmart22"
    "r-txdb.dmelanogaster.ucsc.dm3.ensgene"
    "r-txdb.hsapiens.ucsc.hg19.knowngene"
    "r-txdb.mmusculus.ucsc.mm10.knowngene"
    "r-variantannotation"
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("9e9f0365a23b91bb803fa5a234134635ed3eb859cb72183aee46978454eb7539f125f14e73b9c657f73d63fc5d4f3230c4ac83e8e94966aa62f115acdb009bca")

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
