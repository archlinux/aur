# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=BiocParallel
_bcver=1.30.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Bioconductor facilities for parallel evaluation"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(GPL2 GPL3)
depends=(
    "r>=3.5.0"
	r-futile.logger
	r-snow
	r-bh
)
optdepends=(
    r-biocgenerics
	r-foreach
	r-batchjobs
	r-bbmisc
	r-doparallel
	r-rmpi
	r-genomicranges
	r-rnaseqdata.hnrnpc.bam.chr14
	r-txdb.hsapiens.ucsc.hg19.knowngene
	r-variantannotation
	r-rsamtools
	r-genomicalignments
	r-shortread
	r-codetools
	r-runit
	r-biocstyle
	r-knitr
	r-batchtools
	r-data.table
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=("6bd54210c6ce1eb2f7d7d104317c3f808f9aabc99806fa491d9de5db69ce314f")

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
