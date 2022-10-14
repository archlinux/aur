# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=wk
_cranver=0.7.0
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
b2sums=('aac272e4ad329a972a6ce6b6a775c3a0d82af3c616e47e76ecfd4956093bc1a202f6da633ee3ebda9affb33a8c31c0a90df47899dde79028ed666adc473c1270')

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
