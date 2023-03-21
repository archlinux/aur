# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=diffviewer
_cranver=0.1.1
pkgname=r-${_cranname,,}
pkgdesc="HTML Widget to Show File Differences"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r"
    "r-htmlwidgets"
    "r-jsonlite"
)
optdepends=(
    "r-covr"
    "r-shiny"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("6d90157d0e3bb7cdadc79f6ec259fad8b8b8e6f614fb3be68609c8f475dc4b207116c0e78078773ac52af0fefcee1c59cf22ea197442b6d9afed16ef5f0a3a81")

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
