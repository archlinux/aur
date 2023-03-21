# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=nycflights13
_cranver=1.0.2
pkgname=r-${_cranname,,}
pkgdesc="Airline on-time data for all flights departing NYC in 2013"
url="https://cran.r-project.org/package=${_cranname}"
license=("custom:CC0")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=2.10"
    "r-cpp11"
    "r-tibble"
)
optdepends=(
    "r-readr"
    "r-sf"
    "r-vctrs>=0.3.0"
)

source=(
    "https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz"
    "LICENSE-CC0::https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt"
)
b2sums=(
    "f729b52cd181602df4d8fab55c178c935621a1baab9fedf98a35a02cfdd52f82608fd95a5f1c0dcd5704c5ae9c5c51b7517170e1507b194c9877e63f5a1a68d3"
    "c67b16d3d41480fdaf6d3aaf8fdb05d207ea9c9dd773bbe34a8c13eb5a666bc62a0b3eb2c41954f13d90ed1c031a3956ea287f0aca486d942b829ee4cfdfa3d6"
)
noextract=("${_cranname}_${_cranver}.tar.gz")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    install -Dm0644 "LICENSE-CC0" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
