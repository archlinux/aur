# Maintainer: enotan <enotan@majou.xyz>

pkgname=kakera-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Visual novel library, launcher, and playtime tracker"
arch=('x86_64')
url="https://github.com/enotan/kakera"
license=('MIT')
depends=('fuse2')
optdepends=(
    'wine: launch Windows visual novels using Wine'
    'umu-launcher: launch visual novels using Proton'
    'discord: Discord Rich Presence support'
)
provides=('kakera')
conflicts=('kakera')
options=('!strip')

source=(
    "kakera-${pkgver}.AppImage::https://github.com/enotan/kakera/releases/download/v${pkgver}/kakera_${pkgver}_x86_64.AppImage"
    "kakera.png::https://raw.githubusercontent.com/enotan/kakera/v${pkgver}/assets/favicon.png"
    "LICENSE::https://raw.githubusercontent.com/enotan/kakera/v${pkgver}/LICENSE"
    "kakera.desktop"
)

sha256sums=('c44cd5113e9eda2634748f8de6a16f35e36aad22d0292ff864bb1d99372c9651'
            'a410c45d369a7167a2732c8e46fd46bd0e62137cfad5f2c215c2267baba7ed37'
            '8734477517437e4370233188e791a9167d5a67249d7b05e59e280246e054d6c4'
            'af1c27b344257bb058f9dcd85eb01438b72d1e8603b37b32207b6948f57494c1')

package() {
    install -Dm755 "kakera-${pkgver}.AppImage" \
        "${pkgdir}/opt/kakera/kakera.AppImage"

    install -Dm644 kakera.desktop \
        "${pkgdir}/usr/share/applications/kakera.desktop"

    install -Dm644 kakera.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kakera.png"

    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/kakera/kakera.AppImage "${pkgdir}/usr/bin/kakera"
}
