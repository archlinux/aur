# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>


_cranname=formatR
_cranver=1.13
pkgname=r-${_cranname,,}
pkgdesc="Format R Code Automatically"
url="https://cran.r-project.org/package=${_cranname}"
license=("GPL")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.2.3"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
    "r-rstudioapi"
    "r-shiny"
    "r-testit"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('ae9450e59ac59930a96835d7254d85f6456dc82b68a503f73cbe6add47dced2f114d5b45a508cfbd16ee1cdccc702217af8c926fb2c711d5a6aea4969084b3c4')

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
