# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=gtfstools
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgdesc="Read, manipulate, analyse and write transit feeds in the General
Transit Feed Specification (GTFS) data format"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "r-cpp11"
    "r>=2.10"
    "r-checkmate"
    "r-cli"
    "r-curl"
    "r-data.table"
    "r-gtfsio>=1.0.0"
    "r-parallelly"
    "r-processx"
    "r-sf"
    "r-sfheaders"
    "r-units"
    "r-zip"
)
optdepends=(
    "r-covr"
    "r-ggplot2"
    "r-jsonlite"
    "r-knitr"
    "r-rmarkdown"
)

checkdepends=(
    "${optdepends[@]}"
    "r-testthat>=3.0.0"
)

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('232fb973bb8cdf2bdf914c12d4f3e231992816a798cf753e83c65b765a75a853be16f4b0700e393cf251173b0a01bbfa3a731d8ecf83f5b0202cef790efaf810')

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
