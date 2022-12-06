# Maintainer: peippo <christoph+aur@christophfink.com>

_cranname=sodium
_cranver=1.2.1
pkgname=r-${_cranname,,}
pkgdesc="A Modern and Easy-to-Use Crypto Library"
url="https://cran.r-project.org/package=${_cranname}"
license=("MIT")
pkgver=${_cranver//[:-]/.}
pkgrel=1

arch=("i686" "x86_64")
depends=(
    "libsodium"
    "r"
)
optdepends=(
    "r-knitr"
    "r-rmarkdown"
)
makedepends=()

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=('52e2035cf3b50de405836fdb7b56f895c9b3ec7fe156460c7a33da4e6cb30c2429578686abe0b3c6005b4f01b535fcc29efa127f05b3311437f750047b9f332b')

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
