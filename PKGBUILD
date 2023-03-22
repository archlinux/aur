# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=measurements
_cranver=1.5.0
pkgname=r-${_cranname,,}
pkgdesc="Tools for Units of Measurement"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("02c442a7e0dfacb25902d96ef2fd72c80f60e559b3b9fd56ea1fc608c66a6f720b55a1c4f12774f6d71b021cf837112dc5a460a0c41fcb8647c01b33d0c0d928")

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
