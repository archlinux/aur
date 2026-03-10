# Maintainer: Trần Nam Tuấn <tuantran1632001 at gmail dot com>
# Contributor: Marco Mania <marcomania2012 at gmail dot com>

pkgname=fish-tide
_pkgname=tide
pkgver=6.2.0
pkgrel=6
pkgdesc="🌊 The ultimate Fish prompt."
arch=('any')
url="https://github.com/IlanCosman/tide"
license=('MIT')
depends=('fish')
optdepends=('ttf-meslo-nerd-font-powerlevel10k: recommended font, install this if you only want Meslo LGS Nerd Font variants'
            'ttf-meslo-nerd: recommended font, contains all Meslo Nerd Font variants')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "pr-625.patch::https://github.com/IlanCosman/tide/pull/625.patch")
sha256sums=('c5d229d9d918043739aac93581ac96f00b6f31185b7df1c9864401bcbb69f3bc'
            '5426d86cb803426cb26843933c676ef08d15947937217ce7f30075f859cd1315')

prepare() {
    cd "${_pkgname}-${pkgver}"
    patch -p1 -i ../pr-625.patch
}

package() {
    cd "${_pkgname}-${pkgver}" || exit 1

    find conf.d functions -type f -exec install -Dm 755 '{}' "${pkgdir}/etc/fish/{}" \;

    install -Dm644 completions/* -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

    install -Dm755 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=4 sw=4 et:
