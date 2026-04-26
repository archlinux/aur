# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=shinyloadtest
_pkgver=1.2.1
pkgname=r-shinyloadtest
pkgdesc="Load Test Shiny Applications"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-only")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-cli"
    "r-curl"
    "r-dplyr>=1.0.0"
    "r-ggplot2>=3.4.0"
    "r-httpuv>=1.5.2"
    "r-jsonlite"
    "r-magrittr"
    "r-r6"
    "r-rlang>=0.1.2"
    "r-scales"
    "r-stringr"
    "r-svglite"
    "r-vroom"
    "r-websocket>=1.0.0"
    "r-xml2"
)
optdepends=(
    "r-getpass"
    "r-glue"
    "r-gtable"
    "r-htmltools"
    "r-lubridate"
    "r-progress"
    "r-rmarkdown"
    "r-spelling"
    "r-testthat>=3.2.0"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1a52084ca44c3dfe3dae46e354cd58e8a255ffff837ece67267ae534da25e88d')

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
