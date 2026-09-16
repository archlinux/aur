# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=tesseract
_pkgver=5.3.1
pkgname=r-${_pkgname,,}
pkgdesc="Open Source OCR Engine"
url="https://cran.r-project.org/package=${_pkgname}"
license=("Apache-2.0")
pkgver=${_pkgver//-/.}
pkgrel=4

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
b2sums=('89fa3ec64d62ffb9967007d72a4c68521d887820f6cb9fa18985eada77e57094529f5e37de1bd00770af46189777aef588f7f493a14d4a6ffd7e0abc6bf046f0')

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
