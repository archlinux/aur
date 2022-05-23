# Maintainer: peippo <christoph+aur@christophfink.com>
# Maintainer: Grey Christoforo <first name at last name dot net>

_cranname=BiocManager
_cranver=1.30.18
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A convenient tool to install and update Bioconductor packages."
arch=(x86_64)
url="https://CRAN.R-project.org/package=${_cranname}"
license=("Artistic2.0")
depends=(
    r
    r-remotes
    r-testthat
    r-withr
    r-curl
)
optdepends=(
    r-biocversion
    r-rmarkdown
    r-knitr
)
source=("${pkgname}-${pkgver}.tar.gz::https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
sha256sums=("f763126b45614e1b83260da5311923eac50db24002f3c22fa5f667434a5b5c35")
noextract=(${pkgname}-${pkgver}.tar.gz)

build() {
    R CMD INSTALL ${pkgname}-${pkgver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_cranname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
