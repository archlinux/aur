# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>
pkgname=fish-tide
_pkgname=tide
pkgver=6.2.0
pkgrel=2
pkgdesc="🌊 The ultimate Fish prompt."
arch=('any')
url="https://github.com/IlanCosman/tide"
license=('MIT')
depends=('fish')
makedepends=('findutils')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('b19a9441e6928d972ec5e44235557d4e968f60c9880592612d7a62fc842f779804be033c8a845d1cd1ba5a1650272f30a5eeacd641ba91b39adc3a1d4170ed0d')
conflicts=("fish-tide-git")

package() {
    cd "${_pkgname}-${pkgver}" || exit 1

    find conf.d functions -type f -exec install -Dm 755 '{}' "${pkgdir}/etc/fish/{}" \;

    install -Dm644 completions/* -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

    install -Dm755 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=4 sw=4 et:
