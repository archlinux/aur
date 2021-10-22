# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sfheaders
_cranver=0.4.0
pkgname=r-${_cranname,,}
pkgdesc="Converts Between R Objects and Simple Feature Objects"
url="https://cran.r-project.org/package=sfheaders"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=("r" "r-geometries" "r-rcpp")
optdepends=("r-covr" "r-knitr" "r-testthat")
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=("322a6e1ec7c88fcceebb60ee707105b9")

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
