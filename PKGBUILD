# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=diffviewer
_cranver=0.1.2
pkgname=r-${_cranname,,}
pkgdesc="HTML Widget to Show File Differences"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.6.0"
    "r-htmlwidgets"
    "r-jsonlite"
)
optdepends=(
    "r-covr"
    "r-shiny"
)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("d5cf6773999853b5e7ca9cd3fa6f17e41d717cd2da4cc28c36968dae56015be9e3d3e04461b7ccc72242256159c76b34c40b01c1805c846020c45f6b3fe81f9d")

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
