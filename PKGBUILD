# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=cereal
_cranver=0.1.0
pkgname=r-${_cranname,,}
pkgdesc="Serialize 'vctrs' Objects to 'JSON'"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.6"
    "r-jsonlite"
    "r-rlang"
    "r-tibble"
    "r-vctrs"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("fd994d290554d994c5e221750497cc87d54cd861a176b06a8072e0c85f3bf1243d9de3bf2a1d93517a23d1f64b2705f62ed87c24944fd79a77dd685000da9eb9")

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
