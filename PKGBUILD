# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=osmdata
_pkgver=0.4.1
pkgname=r-osmdata
pkgdesc="Import 'OpenStreetMap' Data as Simple Features or Spatial Objects"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-3.0-only")
pkgver=${_pkgver//-/.}
pkgrel=4
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-curl"
    "r-httr2"
    "r-rcpp>=0.12.4"
    "r-rvest"
    "r-tibble"
    "r-xml2"
)
optdepends=(
    "r-httptest2"
    "r-jsonlite"
    "r-knitr"
    "r-markdown"
    "r-rmarkdown"
    "r-sf"
    "r-sp"
    "r-terra"
    "r-testthat"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5ee078216c9f1de7ca8cfcaa1fc8c38e6b6cf90636b205111775b4c9af4bcdaf')

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
