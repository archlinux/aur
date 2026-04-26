# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=tesseract
_pkgver=5.2.5
pkgname=r-${_pkgname,,}
pkgdesc="Open Source OCR Engine"
url="https://cran.r-project.org/package=${_pkgname}"
license=("Apache-2.0")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("i686" "x86_64")
depends=(
    "r"
    "r-curl"
    "r-digest"
    "r-pdftools>=1.5"
    "r-rappdirs"
    "r-rcpp>=0.12.12"
    "leptonica"
    "tesseract"
)
optdepends=(
    "tesseract-data-eng: English OCR training data"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('a63dbeaa44d0fc40bb194ef67dbdea37d9e0cb0a02a572b6d261be48156fa0bd37365548d510983a39d519c8b075795933b875c3a468b7e204d6e4c5883f6861')

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
