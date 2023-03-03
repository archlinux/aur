# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sfheaders
_cranver=0.4.2
pkgname=r-${_cranname,,}
pkgdesc="Converts Between R Objects and Simple Feature Objects"
url="https://cran.r-project.org/package=sfheaders"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "r>=3.0.2"
    "r-geometries>=0.2.2"
    "r-rcpp>=1.0.10"
)
optdepends=(
    "r-covr"
    "r-knitr"
    "r-testthat"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('2652abb2afda69455faab4b74ae28f397a83793cdc387a00b001f7535bc8ee220534a52cf0d78896c084ca9173af177e0a03394d0594521f13ac4310bfebca2b')

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
