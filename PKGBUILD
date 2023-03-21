# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=Biostrings
_bcver=2.66.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=2
pkgdesc="Efficient manipulation of biological strings"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=(Artistic2.0)
depends=(
    "r>=4.0.0"
	"r-biocgenerics>=0.37.0"
	"r-s4vectors>=0.27.12"
	"r-iranges>=2.23.9"
	"r-xvector>=0.29.2"
	r-genomeinfodb
	r-crayon
)
optdepends=(
    r-bsgenome
	r-bsgenome.celegans.ucsc.ce2
	r-bsgenome.dmelanogaster.ucsc.dm3
	r-bsgenome.hsapiens.ucsc.hg18
	r-drosophila2probe
	r-hgu95av2probe
	r-hgu133aprobe
	r-genomicfeatures
	r-hgu95av2cdf
	r-affy
	r-affydata
	r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('7312c508bc2fe6ea3da75edd621b41a35929f9dbdca16d25eb3724ca2cd206fd')

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
