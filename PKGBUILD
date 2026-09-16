# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=leafem
_pkgver=0.2.5
pkgname=r-leafem
pkgdesc="'leaflet' Extensions for 'mapview'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-base64enc"
    "r-geojsonsf"
    "r-htmltools>=0.3"
    "r-htmlwidgets"
    "r-jsonlite"
    "r-leaflet>=2.0.1"
    "r-raster"
    "r-sf"
    "r-png"
)
optdepends=(
    "r-clipr"
    "r-fontawesome"
    "r-leafgl"
    "r-lwgeom"
    "r-mapdeck"
    "r-plainview"
    "r-stars"
    "r-terra"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6cab254e0c987495b517e550fa22b20128218195a87e98822a7750297f705246')

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
