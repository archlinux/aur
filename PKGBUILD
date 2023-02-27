# Maintainer: peippo <christoph+aur@christophfink.com>
# Maintainer: Grey Christoforo <first name at last name dot net>

_cranname=BiocManager
_cranver=1.30.20
pkgname=r-${_cranname,,}
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A convenient tool to install and update Bioconductor packages."
arch=("i686" "x86_64")
url="https://CRAN.R-project.org/package=${_cranname}"
license=("Artistic2.0")
depends=(
    r
)
optdepends=(
    r-biocversion
    r-curl
    r-knitr
    r-remotes
    r-rmarkdown
    r-testthat
    r-withr
)
source=("${pkgname}-${pkgver}.tar.gz::https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
b2sums=("f70c66f07d361d80f2679af273b9b948cf492ab5ef138dc552b264c462e30c602a3324bda346b181663e2e9f492e432ea48d7e995e311e51dfd98e3519e4a03c")
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
