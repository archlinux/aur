# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sodium
_cranver=1.3.0
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
b2sums=("a353bed15fc1ae25eb821f574e7813bb469a7fb145242e9b0bf7cf1b9ebcba138061c978e9a962033c094a574b61080d09fc22d0161c214da4c57c12486636af")

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
