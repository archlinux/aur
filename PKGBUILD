# Maintainer: Christos Longros <chris.longros@gmail.com>
# Contributor: peippo <christoph+aur@christophfink.com>

_pkgname=diffviewer
_pkgver=0.1.2
pkgname=r-${_pkgname,,}
pkgdesc="HTML Widget to Show File Differences"
url="https://cran.r-project.org/package=${_pkgname}"
license=("MIT")
pkgver=${_pkgver//-/.}
pkgrel=2

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

source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
b2sums=('d5cf6773999853b5e7ca9cd3fa6f17e41d717cd2da4cc28c36968dae56015be9e3d3e04461b7ccc72242256159c76b34c40b01c1805c846020c45f6b3fe81f9d')

build() {
    mkdir -p "${srcdir}/build/"
    R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}/build/"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${srcdir}/build/${_pkgname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_pkgname}/LICENSE" ]]; then
        install -Dm0644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
