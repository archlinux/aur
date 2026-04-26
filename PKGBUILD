# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=maptiles
_pkgver=0.11.0
pkgname=r-${_pkgname,,}
pkgdesc="Download and Display Map Tiles"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-only")
pkgver=${_pkgver//-/.}
pkgrel=3

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
b2sums=('28e9c2e839064e57b12331a30a1b349960fec470906a1a16df6671783a331fb7648708c3473a6f9892aa2d9ae0815e5a4a435d5dd7a16d421f4d9f168a254956')

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
