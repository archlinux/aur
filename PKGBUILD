# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=terra
_cranver=1.5-34
pkgname=r-${_cranname,,}
pkgdesc="Spatial Data Analysis"
url="https://cran.r-project.org/package=terra"
license=("GPL (>= 3)")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=("r" "r-rcpp" "gdal")
optdepends=("r-igraph" "r-tinytest" "r-ncdf4" "r-sf" "r-deldir" "r-raster" "r-xml")
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=('3cad88f4fad6517713861a8debc8c7c746c32e0c2ee851bb0c2bc43744fcaa1c')

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
