# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=leafgl
_pkgver=0.2.4
pkgname=r-${_pkgname,,}
pkgdesc="High-Performance 'WebGl' Rendering for Package 'leaflet'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r"
    "r-htmltools"
    "r-leaflet"
    "r-sf"
    "r-yyjsonr"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('a0e9cce14e6cc7af0db9bd0f4b9e41c9bd5247e62c2add4cf72a564cd55965a40377968a043aedca156e873cd8ccea058312c6ba0c8561b492a0208696bfd744')

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
