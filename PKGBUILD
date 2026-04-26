# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=yyjsonr
_pkgver=0.1.22
pkgname=r-${_pkgname,,}
pkgdesc="Fast 'JSON', 'NDJSON' and 'GeoJSON' Parser and Generator"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=4

arch=("i686" "x86_64")
depends=(
    "r>=4.1.0"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('07a5003a22c5241540bd42a95bb3a5be5279fa734e136237ff7acf91e0490cfeedd9efb793bd0bf4ae3a21c67cfbaf3a8cb180ef2ea5893f89c9d5c9f0a188e4')

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
