# Maintainer: Yamashiro <dev cosmicheron com>
# Contributors: Frederic Bezies, Ronan Rabouin, carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname='yamagi-quake2-rogue'
pkgver='2.14'
pkgrel='1'
arch=('i686' 'x86_64' 'aarch64')
pkgdesc="Quake II - Mission Pack 2 ('Ground Zero') for yamagi-quake2"
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('glibc' 'sh' 'yamagi-quake2')
install="${pkgname}.install"
source=(
    "https://deponie.yamagi.org/quake2/${pkgname#*-}-${pkgver}.tar.xz"
    "${pkgname}.sh"
    "${pkgname}.desktop")
b2sums=(
    '4a554de3089cf504dc6788c0377b044c96ce5957077a8acee8a6fe2b3f9f48a22fb43fe6951402d0aa5e4e004692625297c9c4fd30d5384f581951584c85b880'
    '453640327b8867b260475428012ebb958e2cee6f30ddbed82e2074c126d0d6e137087fb74a65ef46cd38e8d22532012d32f15fb0917dd6f127c6fd56c78e86a8'
    'd80b2328eb85a5461205eebbda04b357e42996f026a1f3cd52fe04066775bed5b73990e6956c164f96d63696c5961ad5ed03e4a9eeb1000a69e60c74aa888c65'
)

build() {
    make -C "${pkgname#*-}-${pkgver}"
}

package() {
    cd "${pkgname#*-}-${pkgver}"

    # game library
    install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/rogue" 'release/game.so'

    # game launcher
    install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # doc
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

    # desktop entry
    install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"
}
