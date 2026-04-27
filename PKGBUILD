# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=terrainr
_pkgver=0.7.6
pkgname=r-terrainr
pkgdesc="Landscape Visualizations in R and 'Unity'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-base64enc"
    "r-ggplot2>=3.4.0"
    "r-glue"
    "r-httr"
    "r-magick>=2.5.0"
    "r-png"
    "r-rlang"
    "r-sf>=1.0-5"
    "r-terra"
    "r-unifir"
    "r-units"
)
optdepends=(
    "r-brio"
    "r-covr"
    "r-jpeg"
    "r-knitr"
    "r-progress"
    "r-progressr"
    "r-rmarkdown"
    "r-testthat"
    "r-tiff"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('976680a09a859e87217c093bc2f8c7740444cf42fca39795a8a7ccc182d27a2a')

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
