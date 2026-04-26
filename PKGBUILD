# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=treesitter
_pkgver=0.3.2
pkgname=r-${_pkgname,,}
pkgdesc="Bindings to 'Tree-Sitter'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("i686" "x86_64")
depends=(
    "r>=4.3.0"
    "r-cli>=3.6.2"
    "r-r6>=2.5.1"
    "r-rlang>=1.1.3"
    "r-vctrs>=0.6.5"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('0d3070aa9eb039d9bc1050ea88e3f6b21803fb6f99fff1d22b2af8f357f47f4c522dd4255ff3c4cce3ef8cf5b610f8f61bf7aec51c6653552ce3bf4da6102c95')

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
