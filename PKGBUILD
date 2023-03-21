# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=DelayedArray
_bcver=0.24.0
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="A unified framework for working transparently with on-disk and in-memory array-like datasets"
arch=(i686 x86_64)
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
license=("Artistic2.0")
depends=(
    "r>=4.0.0"
	"r-biocgenerics>=0.37.0"
	"r-matrixgenerics>=1.1.3"
	"r-s4vectors>=0.27.2"
	"r-iranges>=2.17.3"
)
optdepends=(
    r-biocparallel
	"r-hdf5array>=1.17.12"
	r-genefilter
	r-summarizedexperiment
	r-airway
	r-lobstr
	r-delayedmatrixstats
	r-knitr
	r-rmarkdown
	r-biocstyle
	r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('d764b4f487b49ca04150ea7d8f5f180683cd80575d67a162e4a99cd52bd8815a')

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
