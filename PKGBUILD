# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=geometries
_cranver=0.2.2
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
b2sums=("127ee7c814639e96560c4c8ad254baeef73ea75efc943c863464e2d6885b0b323dabf7c481b706df1cb09c735851519da22cf64d85140863ad21d137399f9669")

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
