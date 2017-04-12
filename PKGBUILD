# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.9.811.13
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. (weekly snapshot)'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
arch=('i686' 'x86_64')
depends=('gtk2' 'nss' 'libxtst' 'gconf' 'libxss' 'freetype2' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'alsa-lib' 'hicolor-icon-theme')
optdepends=(
    'vivaldi-snapshot-ffmpeg-codecs: playback of proprietary video/audio'
    'google-chrome: Widevine DRM Plugin'
    'vivaldi-widevine: Widevine DRM Plugin'
)
source_i686=("https://downloads.vivaldi.com/snapshot/vivaldi-snapshot-${pkgver}-1.i386.rpm")
source_x86_64=("https://downloads.vivaldi.com/snapshot/vivaldi-snapshot-${pkgver}-1.x86_64.rpm")
sha512sums_i686=('822c8500587fc4303af16f66b0f8c28d606113ec7b4ae124bba678f50f0d7a9e879f59652edb36de584f52c1b718289b6edb20ea266c84f79b04029558de73e8')
sha512sums_x86_64=('1b131522e1b3ac96a3e62db6058c8ed6feae0312618580fb741fe15b2dbd859657e4642aa0ef09829d1f7c5c722a686b7bf198799b47ebf2bfda99949e0f3020')

package() {
    cp -a {opt,usr} "$pkgdir"

    # suid sanbox
    chmod 4755 "$pkgdir/opt/vivaldi-snapshot/vivaldi-sandbox"

    # make /usr/bin/vivaldi-snapshot available
    binf="$pkgdir/usr/bin/vivaldi-snapshot"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/$pkgname "$binf"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi-snapshot/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-snapshot.png"
    done
}

