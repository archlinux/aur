# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin, Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2-xatrix'
pkgver='2.14'
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
    '7d1e1655646345e8f0668bd2b475f7f13a4bcde98ce7111aebef80c7f778076a6df3dd3a5397d3b1afee17a26b3be545070d9d81e6d136584b7d34480819c7c2'
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
