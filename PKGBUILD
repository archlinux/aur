# Maintainer: OpenLyst <https://openlyst.ink>
# Unstable build from the app's GitLab nightly release: https://gitlab.com/Openlyst
pkgname=finar-unstable
pkgver=4.2.0
pkgrel=1
pkgdesc="The corrected Jellyfin client (unstable build from GitHub)"
arch=('x86_64' 'aarch64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('finar')
conflicts=('finar')
options=('!strip')
source_x86_64=("finar-unstable-${pkgver}-x86_64.zip::https://gitlab.com/Openlyst/finar/-/releases/nightly/downloads/finar-linux-x64-4.2.0-2026-09-30.zip")
source_aarch64=("finar-unstable-${pkgver}-aarch64.zip::https://gitlab.com/Openlyst/finar/-/releases/nightly/downloads/finar-linux-arm64-4.2.0-2026-09-30.zip")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

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
Comment=The corrected Jellyfin client (unstable build from GitHub)
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

