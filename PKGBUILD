# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=terra
_cranver=1.5-21
pkgname=r-${_cranname,,}
pkgdesc="Spatial Data Analysis"
url="https://cran.r-project.org/package=terra"
license=("GPL (>= 3)")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=("r" "r-rcpp" "gdal")
optdepends=("r-tinytest" "r-ncdf4" "r-sf" "r-deldir" "r-raster")
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("091ee928ccaa6561aa9f8ee6c1c99f139dc89f1653c2a76a035cca14d404f43f")

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
