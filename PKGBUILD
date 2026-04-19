# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=mapview
_cranver=2.11.4
pkgname=r-mapview
pkgdesc="Interactive Viewing of Spatial Data in R"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL-3.0-or-later")
pkgver=${_cranver//[:-]/.}
pkgrel=1
makedepends=("gcc-fortran")

arch=("any")
depends=(
    "r"
    "r-base64enc"
    "r-glue"
    "r-htmltools"
    "r-htmlwidgets"
    "r-leafem"
    "r-leaflet>=2.0.0"
    "r-leafpop"
    "r-png"
    "r-raster>=3.6.3"
    "r-satellite"
    "r-scales>=0.2.5"
    "r-servr"
    "r-sf"
    "r-sp"
)
optdepends=(
    "r-knitr"
    "r-later"
    "r-leaflet.extras2"
    "r-leafsync"
    "r-lwgeom"
    "r-mapdeck"
    "r-plainview"
    "r-poorman"
    "r-rmarkdown"
    "r-rstudioapi"
    "r-s2"
    "r-stars"
    "r-tinytest"
    "r-webshot"
    "r-webshot2"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("61c44b7bcf2692a6d24015f0ddb98d20df307460a577cca1754c7c9447483069")

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
