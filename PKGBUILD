# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=geometries
_cranver=0.2.0
pkgname=r-${_cranname,,}
pkgdesc="Convert Between R Objects and Geometric Structures"
url="https://cran.r-project.org/package=geometries"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=("r" "r-rcpp")
optdepends=("r-covr" "r-knitr" "r-rmarkdown" "r-tinytest")
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=("efeccd6972b857d760e3985583c6ad15")

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
