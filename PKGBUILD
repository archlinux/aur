# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=terra
_cranver=1.6-7
pkgname=r-${_cranname,,}
pkgdesc="Spatial Data Analysis"
url="https://cran.r-project.org/package=terra"
license=("GPL (>= 3)")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "gdal>=2.2.3"
    "geos>=3.4.0"
    "proj>=4.9.3"
    r-rcpp
    "r>=3.5.0"
    sqlite
)
optdepends=(
    r-deldir
    r-leaflet
    r-ncdf4
    r-raster
    "r-sf>=0.9.8"
    r-tinytest
    r-xml
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("3470e03264836a1f9e9cc1029276b7481020042448914bc3948cd8144f3ac7dc")

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
