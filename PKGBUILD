# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-snapshot
pkgver=1.4.589.4
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
sha256sums_i686=('7aa806eda565346d7b1062fa587a8056e04f858198b7c5e17cf3e080bf1452fe')
sha256sums_x86_64=('445b3b053d9073b95aaa8145e681fadd3ba2caf57dd52336c588c6f058430855')

package() {
    cp -a {opt,usr} "$pkgdir"

    # suid sanbox
    chmod 4755 "$pkgdir/opt/vivaldi-snapshot/vivaldi-sandbox"

    # make /usr/bin/vivaldi-snapshot available
    if [[ ! -e "$pkgdir/usr/bin/vivaldi-snapshot" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/vivaldi-snapshot/vivaldi-snapshot \
            "$pkgdir/usr/bin/vivaldi-snapshot"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi-snapshot/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi-snapshot.png"
    done
}

