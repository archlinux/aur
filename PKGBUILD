# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=bitops
_cranver=1.0-7
pkgname=r-${_cranname,,}
pkgdesc="Bitwise Operations"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL2" "GPL3")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('4adf0cb3a59a949ec57fb7b176d7963f4a7f356d68f3aa6486c8b3f21ff9f75b6e86bc4c007de25b0327532ab81cd297b44ebbd7cb15286e80953a6ed4eaf7f8')

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
