# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Frederic Bezies, Ronan Rabouin, Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2-ctf'
pkgver='1.11'
pkgrel='1'
arch=('i686' 'x86_64' 'aarch64')
pkgdesc='Quake II - Three Wave Capture The Flag for yamagi-quake2'
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('glibc' 'sh' 'yamagi-quake2')
source=(
    "http://deponie.yamagi.org/quake2/${pkgname#*-}-$pkgver.tar.xz"
    "$pkgname.sh"
    "$pkgname.desktop")
b2sums=(
    'abc4ce8c852f687c08e503e802f6d203b1090f3c903e38f38eb9f8c3127ef2b51b45455f3573ce2aae2482615caba4f315d30c9ea20210d26aeba23c9af0bc73'
    'a795e4c5fe15f5de92ad454cb165ead6a385a31451bf856a7191740ee9164f54d32fbd8eedf48c2585e47ed60c79c2caf84a5cb21d50ef3e8c6f0834c5e5e6ac'
    'e982a00b16c4982aea0fd566632b5c4e2d0680059025b56a92d844795700b65d77a79c9506dee07a8ab537bee960b3307c29f72b464d72d8a34a9244a04e2d47'
)

build() {
    make -C ${pkgname#*-}-$pkgver
}

package() {
    cd "${pkgname#*-}-${pkgver}"

    # game library
    install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/ctf" 'release/game.so'

    # game launcher
    install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # doc
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" 'README.md'

    # desktop entry
    install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"
}
