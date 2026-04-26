# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=cereal
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgdesc="Serialize 'vctrs' Objects to 'JSON'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=3.6"
    "r-jsonlite"
    "r-rlang"
    "r-tibble"
    "r-vctrs"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('fd994d290554d994c5e221750497cc87d54cd861a176b06a8072e0c85f3bf1243d9de3bf2a1d93517a23d1f64b2705f62ed87c24944fd79a77dd685000da9eb9')

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
