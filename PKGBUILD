# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=r5r
_pkgver=2.3.0
pkgname=r-${_pkgname,,}
pkgdesc="Rapid Realistic Routing with ‘R5’"
url="https://cran.r-project.org/package=r5r"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=6

arch=("any")
depends=(
    "r-concaveman"
    "r-dplyr"
    "r-h3jsr"
    "r-gtfstools"
    "jdk11-openjdk"
    "r-checkmate"
    "r-curl"
    "r-data.table"
    "r-httr"
    "r-jsonlite"
    "r-raster"
    "r-rjava>=0.9.10"
    "r-sf>=1.0.6"
    "r-sfheaders"
    "r-zip"
    "r>=3.6"
)
optdepends=(
    "r-covr"
    "r-dplyr"
    "r-ggplot2>=3.3.1"
    "r-gtfstools"
    "r-h3jsr>=1.3.0"
    "r-interp"
    "r-knitr"
    "r-patchwork"
    "r-rmarkdown"
)

checkdepends=(
    "${optdepends[@]}"
    "r-testthat"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('c70edbc7d67c7bc72b099e70d22bf1a9962a0a9f48fa1eae94e476932b74fab8afad1cd328b4df6fa8115276959b0c451f542974ec0a47d3f833b4200ae16392')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}


package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"
    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
