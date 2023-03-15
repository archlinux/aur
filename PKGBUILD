# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=s2
_cranver=1.1.2
pkgname=r-${_cranname,,}
pkgdesc="Spherical Geometry Operators Using the S2 Geometry Library"
url="https://cran.r-project.org/package=s2"
license=(Apache)
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "openssl>=1.0.1"
    "r>=3.0.0"
    "r-rcpp"
    "r-wk>=0.6.0"
)
optdepends=(
    "r-testthat>=3.0.0"
    "r-vctrs"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("2590bb6f1e2817393e1ee5c21e58cb3891a8b782333a1548f584f0e426ce392c7a34890332a32dbb3f3ce3dddd4f20d158dac8bc4b100e35d6a9f0fc26af81d1")

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
