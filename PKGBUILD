# Maintainer: Yamashiro <dev cosmicheron com>
# Contributors: Frederic Bezies, Ronan Rabouin, carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname='yamagi-quake2-xatrix'
pkgver='2.16'
pkgrel='1'
arch=('i686' 'x86_64' 'aarch64')
pkgdesc="Quake II - Mission Pack 1 ('The Reckoning') for yamagi-quake2"
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('glibc' 'sh' 'yamagi-quake2')
install="${pkgname}.install"
source=(
    "https://deponie.yamagi.org/quake2/${pkgname#*-}-${pkgver}.tar.xz"
    "${pkgname}.sh"
    "${pkgname}.desktop"
)
b2sums=(
    'ab544df0ab8b4cc978d7973199234413cd3d9e4fe93ad727e47258a5cd7d2731b1e3dbf358d048999bb4197441161a9a0f1e38abc9f8522dd7e190b9d7ba6544'
    'e80203cbda3f903705569b75cf8603dc34a27d43297d987ea7e65334189c978c37ac010e25b9244a2c5f06e20ecaf2df12dbfb644395a522efc9215b468c1b6d'
    'ba6c2af8cfe5f9aff96d92561f6271496317cdf8dee7c5977a9374b996fd5763075c129cd3dccf96849bdeef793b8c9726a24dc4395bac740ef8682bc9f1d035'
)

build() {
    make -C "${pkgname#*-}-${pkgver}"
}

package() {
    cd "${pkgname#*-}-${pkgver}"

    # game library
    install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/xatrix" 'release/game.so'

    # game launcher
    install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # doc
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

    # desktop entry
    install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"
}
