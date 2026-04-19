# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=mapboxapi
_cranver=0.6.3
pkgname=r-mapboxapi
pkgdesc="R Interface to 'Mapbox' Web Services"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1
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
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("1ed753cc424d76b793692444c9424303d8dce8d29fc01a06cec18f3d841dba5b")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${srcdir}/build/${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${srcdir}/build/${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
