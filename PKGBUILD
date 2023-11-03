# Maintainer: Grey Christoforo <first name at last name dot net>
# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

_cranname=RCurl
pkgname=r-${_cranname,,}

_cranver=1.98-1.13
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
b2sums=("f1b9f79af4d0f85150e8843fdbd4e1aa5b3f53c3a759d9b76c4e7015a9c1e9b04bac8286ea7ce5550874e74c4022c0b431b487ad5465b6626dc34cc2432a743a")

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
