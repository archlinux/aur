# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=maptiles
_pkgver=0.13.0
pkgname=r-${_pkgname,,}
pkgdesc="Download and Display Map Tiles"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-only")
pkgver=${_pkgver//-/.}
pkgrel=5

arch=("any")
depends=(
    "r>=3.5.0"
    "r-curl"
    "r-digest"
    "r-png"
    "r-sf"
    "r-terra>=1.8.21"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('238818d2590eded703b86df19fb1c43003c77db5e0efec0ba0751b93eb56c6b82e990d950c4461bd80e945d91d9059c2b5b23e9f74c2f24df34214a6cf9b4b50')

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
