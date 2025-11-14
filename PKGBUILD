# Maintainer: Marco Mania <marcomania2012 at gmail dot com>

pkgname=fish-tide
_pkgname=tide
pkgver=6.2.0
pkgrel=3
pkgdesc="🌊 The ultimate Fish prompt."
arch=('any')
url="https://github.com/IlanCosman/tide"
license=('MIT')
depends=('fish')
makedepends=('findutils')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "mesloLGS_NF_regular.ttf::${url}/blob/assets/fonts/mesloLGS_NF_regular.ttf?raw=true"
        "mesloLGS_NF_bold.ttf::${url}/blob/assets/fonts/mesloLGS_NF_bold.ttf?raw=true"
        "mesloLGS_NF_italic.ttf::${url}/blob/assets/fonts/mesloLGS_NF_italic.ttf?raw=true"
        "mesloLGS_NF_bold_italic.ttf::${url}/blob/assets/fonts/mesloLGS_NF_bold_italic.ttf?raw=true")
b2sums=('b19a9441e6928d972ec5e44235557d4e968f60c9880592612d7a62fc842f779804be033c8a845d1cd1ba5a1650272f30a5eeacd641ba91b39adc3a1d4170ed0d'
        'e5fd3520a2d92c210b255f076be783136e17cbff99f2f75115c53d0af059e1534fb54c8b6bf49d6b085306189c8410246c3edab7d0ceddf7fbdaee69bc72fbfe'
        'b2cb8e8e9ba460c67e546eee9054d40cdec76b4b52006821bbd04978906a0612bb027cd43127c9fbbbd05186794a7cf00f8de6a994005a3015d3ca2ab9a739e2'
        'a80c207bf2fa13619e73b618e1c7c1a5adebd65d93e6db7cc7ac016d133d9b11f0e5fc2f3b4a1b1924601a3e1213e90182a8b76f86f08fec45fafc0ff2968e32'
        'd378b94326fc529fc486ed9c5b3bd728a24dc0c2a8159f0c09641b9c51742a18ef18473ab285095ec67bcb7dec14088614e416ff0efab274997380657ad1400d')
conflicts=("fish-tide-git")

package() {
    cd "${_pkgname}-${pkgver}" || exit 1

    find conf.d functions -type f -exec install -Dm 755 '{}' "${pkgdir}/etc/fish/{}" \;

    install -Dm644 completions/* -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

    install -Dm755 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "${srcdir}/mesloLGS_NF_regular.ttf" \
                   "${srcdir}/mesloLGS_NF_bold.ttf" \
                   "${srcdir}/mesloLGS_NF_italic.ttf" \
                   "${srcdir}/mesloLGS_NF_bold_italic.ttf" \
                   -t "${pkgdir}/usr/share/fonts/TTF/"
}

# vim:set ts=4 sw=4 et:
