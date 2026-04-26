# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=treesitter.r
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgdesc="'R' Grammar for 'Tree-Sitter'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=5

arch=("i686" "x86_64")
depends=(
    "r>=4.3.0"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('f4ec9f8a6da2fb4048ead7b794d7cb13013d1c5e01e16d7a8d82227896e903dd3f7dd9088cae0ed66089313190f0ee00260b5e5b6e07139156895f5d163b9780')

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
