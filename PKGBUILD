# Maintainer: Christos Longros <chris.longros@gmail.com>

_cranname=treesitter.r
_cranver=1.2.0
pkgname=r-${_cranname,,}
pkgdesc="'R' Grammar for 'Tree-Sitter'"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=4.3.0"
)
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("f4ec9f8a6da2fb4048ead7b794d7cb13013d1c5e01e16d7a8d82227896e903dd3f7dd9088cae0ed66089313190f0ee00260b5e5b6e07139156895f5d163b9780")

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
