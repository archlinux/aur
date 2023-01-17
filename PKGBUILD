# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Jooa <aur at (name) dot xyz>

_cranname=raster
_cranver=3.6-14
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
b2sums=("b8e9ad9b5449d79264b1aafdc6cb2bd334e671cace400af70f3077013109d4dace921b493620441b4913556bf1cd9cfb7e7426cb3e947e21531b69f5ea3dee25")

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
