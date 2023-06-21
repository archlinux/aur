# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=RCurl
pkgname=r-${_cranname,,}

_cranver=1.98-1.12
pkgver=${_cranver//[:-]/.}
pkgrel=1

pkgdesc="General Network (HTTP/FTP/...) Client Interface for R"
url="https://cran.r-project.org/package=${_cranname}"

arch=(i686 x86_64)
license=(BSD)

depends=(
    curl
    "r>=3.4.0"
    r-bitops
)
optdepends=(r-xml)

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("5aeedcb97d79abe55579519a55bae9cd2f8241b36a2f3f52d9234fdcbd5b45b2835536a69fb5802c7254f960de1fada2b13292ea3cb2d9cfb53f86c260549eac")

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
