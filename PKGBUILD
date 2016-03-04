# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-beta
pkgver=1.0.403.24
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. (beta)'
url="https://vivaldi.com"
install=vivaldi.install
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib')
optdepends=(
    'vivaldi-beta-ffmpeg-codecs: playback of proprietary video/audio'
    'google-chrome: Widevine DRM Plugin'
)
conflicts=('vivaldi')
source_i686=("https://vivaldi.com/download/stable/vivaldi-beta-${pkgver}-1.i386.rpm")
source_x86_64=("https://vivaldi.com/download/stable/vivaldi-beta-${pkgver}-1.x86_64.rpm")
sha256sums_i686=('5e76bc34217ba30ce2aa7608213ffa676d553d42bb4ca4720380bc7bb30c157a')
sha256sums_x86_64=('bd2dda31e538d34ee0a8cf2515e78a30c66ec3ec8f66253572533a4d99dc7459')

package() {
    cp -a {opt,usr} "$pkgdir"

    # suid sanbox
    chmod 4755 "$pkgdir/opt/vivaldi-beta/vivaldi-sandbox"

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi-beta/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-beta.png"
    done
}

