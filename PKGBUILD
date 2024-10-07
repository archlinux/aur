# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sodium
_cranver=1.3.2
pkgname=r-${_cranname,,}
pkgdesc="A Modern and Easy-to-Use Crypto Library"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "libsodium>=1.0.3"
    "r"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("3dcc1b53a2c2e3256c7fb186505e4236ac15b0150c52cd14d93577ddc4079411b62f3531cbfdf76d1cbca75f605d4f49855caf3973eee074c37c7e066ef5b792")

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
