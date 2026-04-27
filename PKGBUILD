# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=cardx
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgdesc="Extra Analysis Results Data Utilities"
url="https://cran.r-project.org/package=${_pkgname}"
license=("Apache-2.0")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=4.2"
    "r-cards>=0.7.0"
    "r-cli>=3.6.1"
    "r-dplyr>=1.2.0"
    "r-glue>=1.6.2"
    "r-lifecycle>=1.0.3"
    "r-rlang>=1.1.1"
    "r-tidyr>=1.3.0"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('17f0c515a67c7440d6355e611939d475552a952be31f7097509e057ab9f7a787ecebe11eb833de3d00bf75be3d4abb89c446e33014af552f0e9a035c547a4ed5')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${srcdir}/build/${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${srcdir}/build/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
