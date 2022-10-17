# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=RCurl
pkgname=r-${_cranname,,}

_cranver=1.98-1.9
pkgver=${_cranver//[:-]/.}
pkgrel=1

pkgdesc="General Network (HTTP/FTP/...) Client Interface for R"
url="https://cran.r-project.org/package=${_cranname}"

arch=(i686 x86_64)
license=(BSD3)

depends=(
    curl
    "r>=3.4.0"
    r-bitops
)
optdepends=(r-xml)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("821c5472ce60263a3a1cc9a0f8abf5b8ce788ecfb8a62967bb05bc0e4743a25256942d2d6964bdac34e205abaafe6eec775e80ed38e08aa9a21c3ac24083e45b")

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
