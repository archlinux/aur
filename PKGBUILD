# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-beta
pkgver=1.0.344.37
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
sha256sums_i686=('2ff91e98ac023e1b30bc8fdf468eb034c3a09de342225a6fa202efb15ea3f027')
sha256sums_x86_64=('1a20a0b3a691586774ee787b111bc5b84008a625c6bc62c90c258945b1c98089')

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

