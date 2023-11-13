# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>


_cranname=stringi
_cranver=1.8.1
pkgname=r-${_cranname,,}
pkgdesc="Fast and Portable Character String Processing Facilities"
url="https://cran.r-project.org/package=${_cranname}"
license=("custom")
pkgver=${_cranver//[:-]/.}
pkgrel=2

arch=("i686" "x86_64")
depends=(
    "icu>=61"
    "r>=3.4"
    "r-cpp11"
)
optdepends=()
makedepends=(
    "r-roxygen2"
    "r-pkgbuild"
)
# checkdepends=(
#     "${optdepends[@]}"
#     "r-tinytest"
# )

source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("c4d188e3627d91417ff093bfe6f6cc57126ca346aa1fb28a30d12c7730f6197cf3c61451dd7d59c3467eec9fe006b0d13cabf593a85cf151d651cf0e419bf735")

build() {
    R CMD INSTALL ${_cranname}_${_cranver}.tar.gz -l "${srcdir}"
}

# check() {
#     export R_LIBS="build/"
#     R CMD check --no-manual "${_cranname}"
# }

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
