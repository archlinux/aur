# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=wk
_cranver=0.7.2
pkgname=r-${_cranname,,}
pkgdesc="Lightweight Well-Known Geometry Parsing"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=2.10"
    "r-cpp11"
)
optdepends=(
    "r-readr"
    "r-sf"
    "r-testthat>=3.0.0"
    "r-tibble"
    "r-vctrs>=0.3.0"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("27a66b2b587491152832f2baf64521db8c051c57860087a38df7835bacdb1691b60ac69ec992abf2d77943d7c03babd45511dea2ef939837058775ae85889d78")

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
