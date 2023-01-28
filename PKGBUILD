# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=RCurl
pkgname=r-${_cranname,,}

_cranver=1.98-1.10
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
b2sums=('cced13aab9b590e8adbe9e46bace215e79d6a11b06e7286265ccfe2fb35c42f3c550b9e477860b8d43621bec19c2f16f176bf021b22f7a2979b5abe6809e0fdd')

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
