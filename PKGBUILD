# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=s2
_cranver=1.1.1
pkgname=r-${_cranname,,}
pkgdesc="Spherical Geometry Operators Using the S2 Geometry Library"
url="https://cran.r-project.org/package=s2"
license=(Apache)
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "openssl"
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
b2sums=("4d8fa5c897330b878fbd9e824c2aa299029dfa077527c83b7b3dcc880f92caab90ebf0a221c896db73d729b47979de396cdb7fecd0dcc4bfe7ccca41a5f966ce")

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
