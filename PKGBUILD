# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=mapboxapi
_pkgver=0.6.3
pkgname=r-mapboxapi
pkgdesc="R Interface to 'Mapbox' Web Services"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-httr"
    "r-sf"
    "r-jsonlite"
    "r-purrr"
    "r-curl"
    "r-dplyr>=1.0.0"
    "r-tidyr>=1.0.0"
    "r-aws.s3"
    "r-stringi"
    "r-slippymath"
    "r-protolite"
    "r-rlang"
    "r-geojsonsf"
    "r-magick"
    "r-leaflet"
    "r-units"
    "r-raster"
    "r-png"
    "r-jpeg"
    "r-htmltools"
)
optdepends=(
    "r-ggspatial"
    "r-mapdeck"
    "r-tigris"
    "r-tidycensus"
    "r-tmap"
    "r-mapboxer"
    "r-testthat>=3.0.0"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1ed753cc424d76b793692444c9424303d8dce8d29fc01a06cec18f3d841dba5b')

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
