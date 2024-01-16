# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=geometries
_cranver=0.2.4
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
b2sums=("0d7ad3395ed6709b025bceb5faed0a5e34fb83edcd66f4dddee9a2838822eccf414b9a2f9723771529fa0dd723b35e13698249fe5a62cc90f1510e7c82e2a961")

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
