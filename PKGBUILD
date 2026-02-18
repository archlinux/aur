# Maintainer: OpenLyst <https://openlyst.ink>
# Unstable build from GitHub releases: https://github.com/justacalico/Openlyst-more-builds/releases
pkgname=opentorrent-unstable
pkgver=2.0.0
pkgrel=1
pkgdesc="qBittorrent client (unstable build from GitHub)"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('opentorrent')
conflicts=('opentorrent')
options=('!strip')
source=("opentorrent-unstable-${pkgver}.zip::https://github.com/justacalico/Openlyst-more-builds/releases/download/build-33/opentorrent-2.0.0-2026-02-18-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    install -d "${pkgdir}/opt/opentorrent"
    install -Dm755 "opentorrent" "${pkgdir}/opt/opentorrent/opentorrent"
    install -d "${pkgdir}/opt/opentorrent/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/opentorrent/lib/"
    cp -r data "${pkgdir}/opt/opentorrent/"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/opentorrent.desktop" <<EOF
[Desktop Entry]
Name=Opentorrent
Comment=qBittorrent client (unstable build from GitHub)
Exec=/opt/opentorrent/opentorrent
Icon=opentorrent
Type=Application
Categories=Network;FileTransfer;;
Keywords=torrent;download;;
EOF
    if [ -f "data/flutter_assets/assets/icons/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/opentorrent.png"
    fi
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/opentorrent/opentorrent "${pkgdir}/usr/bin/opentorrent"
}

