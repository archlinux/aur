# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_cranname=raster
_cranver=3.6-11
pkgname=r-${_cranname,,}
pkgdesc="Geographic Data Analysis and Modeling"
url="https://cran.r-project.org/package=${_cranname}"
license=(GPL3)
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=(i686 x86_64)
depends=(
    "r-rcpp"
    "r-sp>=1.4.5"
    "r-terra>=1.6.41"
    "r>=3.5.0"
)
optdepends=(
    "r-exactextractr"
    "r-fields"
    "r-gstat"
    "r-igraph"
    "r-mass"
    "r-ncdf4"
    "r-rastervis"
    "r-sf"
    "r-tinytest"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('5e10dae49d8c7741f80a4ea1494b0c6eeaae47cdb34575b5e13dd0a3d26ac829eaf0d935904b07931c703e07874211d9a53c3f940bb7b4e07347242d9d164b53')

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
