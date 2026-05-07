# Maintainer: OpenLyst <https://openlyst.ink>
# Unstable build from GitHub releases: https://github.com/openlyst/builds/releases
pkgname=finar-unstable
pkgver=4.1.1
pkgrel=1
pkgdesc="Jellyfin frontend client (unstable build from GitHub)"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('finar')
conflicts=('finar')
options=('!strip')
source=("finar-unstable-${pkgver}.zip::https://github.com/openlyst/builds/releases/download/build-94/finar-4.1.1-2026-05-07-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    install -d "${pkgdir}/opt/finar"
    install -Dm755 "finar" "${pkgdir}/opt/finar/finar"
    install -d "${pkgdir}/opt/finar/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/finar/lib/"
    cp -r data "${pkgdir}/opt/finar/"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/finar.desktop" <<EOF
[Desktop Entry]
Name=Finar
Comment=Jellyfin frontend client (unstable build from GitHub)
Exec=/opt/finar/finar
Icon=finar
Type=Application
Categories=AudioVideo;Video;Player;
Keywords=jellyfin;media;video;streaming;;
EOF
    if [ -f "data/finar.png" ]; then
        install -Dm644 "data/finar.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/finar.png"
    fi
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/finar/finar "${pkgdir}/usr/bin/finar"
}

