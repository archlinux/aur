# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=RCurl
pkgname=r-${_cranname,,}

_cranver=1.98-1.8
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
makedepends=(make)
optdepends=(r-xml)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("1e3b51acbfe600dec94668fd781f3b6f27b6074cc727824855c6334f8cc88f28")

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
