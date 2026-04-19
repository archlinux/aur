# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=rapidoc
_cranver=9.3.4
pkgname=r-${_cranname,,}
pkgdesc="Generates 'RapiDoc' API Documentation"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("a961ab6b9a17890b56a0ba5f9442a308f8d0acfb8a234290220fec3a5075114c109f8fa12285e6797eb59185a3d966f052a9856f50b936989c65a4a86b49e61a")

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
