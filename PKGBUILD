# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=terra
_cranver=1.6-47
pkgname=r-${_cranname,,}
pkgdesc="Spatial Data Analysis"
url="https://cran.r-project.org/package=terra"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "gdal>=2.2.3"
    "geos>=3.4.0"
    "proj>=4.9.3"
    "r-rcpp"
    "r>=3.5.0"
    "sqlite"
)
optdepends=(
    "r-deldir"
    "r-leaflet"
    "r-ncdf4"
    "r-sf>=0.9.8"
    "r-tinytest"
    "r-xml"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('3162369daa207ea7f5757d5db6b7e32d48dc9c99b81c97729bf78609c83a19f3adb31d32b669324b020284daa3c42630c84ecdb4e2d2f4675a288fea6b2cd3d5')

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
