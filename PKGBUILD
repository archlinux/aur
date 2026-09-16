# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=cardx
_pkgver=0.3.4
pkgname=r-${_pkgname,,}
pkgdesc="Extra Analysis Results Data Utilities"
url="https://cran.r-project.org/package=${_pkgname}"
license=("Apache-2.0")
pkgver=${_pkgver//-/.}
pkgrel=4

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
b2sums=('55d8e42c6e9c2a370b4fdd742eb9a7294c285c24e55eedea1fc2fc8095ec159caa8b14d316db414e359d8b2572f9e5610bc726af4dbcbcd1aa66d69d9f37be30')

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
