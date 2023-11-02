# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=Biostrings
_bcver=2.70.1

pkgname=r-${_bcname,,}
pkgdesc="Efficient manipulation of biological strings"
url="https://bioconductor.org/packages/release/bioc/html/${_bcname}.html"
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=(i686 x86_64)
license=(Artistic2.0)

depends=(
    "r>=4.0.0"
    "r-biocgenerics>=0.37.0"
    "r-crayon"
    "r-genomeinfodb"
    "r-iranges>=2.31.2"
    "r-s4vectors>=0.27.12"
    "r-xvector>=0.37.1"
)
optdepends=(
    "r-affy>=1.41.3"
    "r-affydata>=1.11.5"
    "r-biocstyle"
    "r-bsgenome>=1.13.14"
    "r-bsgenome.celegans.ucsc.ce2>=1.3.11"
    "r-bsgenome.dmelanogaster.ucsc.dm3>=1.3.11"
    "r-bsgenome.hsapiens.ucsc.hg18"
    "r-drosophila2probe"
    "r-genomicfeatures>=1.3.14"
    "r-hgu133aprobe"
    "r-hgu95av2cdf"
    "r-hgu95av2probe"
    "r-knitr"
    "r-runit"
)

source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=('858bd8c07272385ba65252e6da988b3b8592f9f3aeebc437d65524c328d500605baf1fb3263459732a563f53e48512b86652e34ed6ad8e497b8d52eddd4a0f6b')

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
