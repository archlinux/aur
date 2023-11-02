# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomeInfoDbData
_bcver=1.2.11
pkgname=r-${_bcname,,}
pkgdesc="Species and taxonomy ID look up tables used by GenomeInfoDb"
url="https://bioconductor.org/packages/release/data/annotation/html/${_bcname}.html"
license=(Artistic2.0)
pkgver=${_bcver//[:-]/.}
pkgrel=1

arch=("any")
depends=(
    "r>=3.5.0"
)

source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_bcname}_${_bcver}.tar.gz")
b2sums=("d9235a5eb959bfbb8a22f68352b58f5d69def64d19606f88871ae398dbc7bebeda7e543c557c1eb48dc90c61a18eb3e503621943b119b2291b220d7e97a3f865")

build() {
    R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_bcname}/LICENSE" ]]; then
        install -Dm0644 "${_bcname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
