# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=treesitter.r
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgdesc="'R' Grammar for 'Tree-Sitter'"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=6

arch=("i686" "x86_64")
depends=(
    "r>=4.3.0"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('727f44b36a0ae0ccb67d1b0279c567d4db8d6063d0bbf03dd55320a4ba0a517bb0671f5608645391a3cdfbada1fac4ead8bd1ea9795c22b9693487bcac78d51f')

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
