# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=bundle
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgdesc="Serialize Model Objects with a Consistent Interface"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("any")
depends=(
    "r>=4.1"
    "r-glue"
    "r-lifecycle"
    "r-purrr"
    "r-rlang"
    "r-withr"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('2aba64af0b4239285b522f230c1488dc77a40d85c05c29cf00d9eeed1728f83328e79202a3a56f87a1ac4f589f690b7d878fb553067cba52b3bcd094e10ab0fa')

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
