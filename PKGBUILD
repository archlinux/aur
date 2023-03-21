# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=BiocParallel
_bcver=1.32.6
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
sha256sums=('40d26698c2fa5e33418d41e6b95657b5ee6f9f5122a5e1ac6940222d5d5903ab')

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
