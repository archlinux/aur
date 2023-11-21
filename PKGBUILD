# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sodium
_cranver=1.3.1
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
b2sums=("cd9bfc3d9131ccd93a616c5cfed013295fea29d0fcd9f27bf1e14cc4c83a29c02c3f7cf49a01a78efddb2645787b718fe87d009542d44f35432289c696436bad")

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
