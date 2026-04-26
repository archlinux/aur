# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=PKI
_pkgver=0.1-15
pkgname=r-${_pkgname,,}
pkgdesc="Public Key Infrastructure for R Based on the X.509 Standard"
url="https://cran.r-project.org/package=${_pkgname}"
license=("GPL-2.0-or-later")
pkgver=${_pkgver//-/.}
pkgrel=3

arch=("i686" "x86_64")
depends=(
    "r>=2.9.0"
    "r-base64enc"
    "openssl"
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('446cd53d30d5125f44f88a9005c7f13ecb41809c02bd28131a5395dd1e9b11d939d85231afcd837b6cbe782a2dd6fbe5809d402245fd53d7bd63bdd2f7a61770')

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
