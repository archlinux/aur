# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Grey Christoforo <first name at last name dot net>

_bcname=GenomeInfoDbData
_bcver=1.2.9
pkgname=r-${_bcname,,}
pkgver=${_bcver//[:-]/.}
pkgrel=1
pkgdesc="Species and taxonomy ID look up tables used by GenomeInfoDb"
arch=(any)
url="https://bioconductor.org/packages/release/data/annotation/html/${_bcname}.html"
license=(Artistic-2.0)
depends=('r>=3.5.0')
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_bcname}_${_bcver}.tar.gz")
sha256sums=('e63a719a8eceefeda39fc95de83e7aa41caad39705efc712a44ab4021adc45fa')

build() {
    R CMD INSTALL ${_bcname}_${_bcver}.tar.gz -l "${srcdir}"
}

package() {
    install -dm0755 "${pkgdir}/usr/lib/R/library"
    cp -a --no-preserve=ownership "${_bcname}" "${pkgdir}/usr/lib/R/library"

    if [[ -f "${_cranname}/LICENSE" ]]; then
        install -Dm0644 "${_cranname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
