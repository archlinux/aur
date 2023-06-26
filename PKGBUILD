# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=geometries
_cranver=0.2.3
pkgname=r-${_cranname,,}
pkgdesc="Convert Between R Objects and Geometric Structures"
url="https://cran.r-project.org/package=geometries"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r"
    "r-rcpp>=1.0.10"
)
optdepends=(
    "r-covr"
    "r-knitr"
    "r-rmarkdown"
    "r-tinytest"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("c88fe022ca0e67c932cedb058fe74105666a1a841328a89112fc02dbadee17d53403885516e53024ec7bec794f6d5df1c06fa561dfd90442060be02c88c742b3")

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
