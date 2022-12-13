# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=wk
_cranver=0.7.1
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
b2sums=("435ebe6d17ffe0e54bd2f68aae2c436ed124f7f82c4fc7c23125f8346ca67a848dc0b425e37c8fb24460e9362e7d2d74146b26ddbc91e9967d745b75445e5e50")

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
