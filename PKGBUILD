# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=osmdata
_cranver=0.3.0
pkgname=r-osmdata
pkgdesc="Import 'OpenStreetMap' Data as Simple Features or Spatial Objects"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-3.0-only")
pkgver=${_cranver//[:-]/.}
pkgrel=1
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
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("26cbe70d7f1c5940f32fa4b9ac8fdbe6f5cf640abb1d11df7e1931e27fecf515")

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
