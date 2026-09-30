# Maintainer: OpenLyst <https://openlyst.ink>
# Deprecated - use finar-unstable instead. Kept so existing installs still build.
pkgname=finar-bin-unstable
pkgver=4.1.1
pkgrel=2
pkgdesc="Deprecated - install finar-unstable instead"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('finar')
conflicts=('finar')
options=('!strip')
install=finar-bin-unstable.install
source=("finar-bin-unstable-${pkgver}.zip::https://gitlab.com/Openlyst/finar/-/releases/nightly/downloads/finar-linux-x64-4.1.1-2026-09-29.zip")
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

