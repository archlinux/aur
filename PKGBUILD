# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=plumber
_pkgver=1.3.3
pkgname=r-plumber
pkgdesc="An API Generator for R"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-crayon"
    "r-httpuv>=1.5.5"
    "r-jsonlite>=0.9.16"
    "r-lifecycle>=1.0.0"
    "r-magrittr"
    "r-mime"
    "r-promises>=1.1.0"
    "r-r6>=2.0.0"
    "r-rlang>=1.0.0"
    "r-sodium"
    "r-stringi>=0.3.0"
    "r-swagger>=3.33.0"
    "r-webutils>=1.1"
)
optdepends=(
    "r-arrow"
    "r-base64enc"
    "r-coro"
    "r-future"
    "r-geojsonsf"
    "r-htmlwidgets"
    "r-later"
    "r-ragg"
    "r-rapidoc"
    "r-readr"
    "r-readxl"
    "r-redoc"
    "r-rmarkdown"
    "r-rstudioapi"
    "r-sf"
    "r-spelling"
    "r-svglite"
    "r-testthat>=0.11.0"
    "r-visnetwork"
    "r-withr"
    "r-writexl"
    "r-yaml"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e72b43c84c32404f0a75ea1b3b8e3153cc4d4dd9021e90929a882f56da1d9c91')

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
