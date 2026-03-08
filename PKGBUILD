# Maintainer: OpenLyst <https://openlyst.ink>
# Unstable build from GitHub releases: https://github.com/openlyst/builds/releases
pkgname=klit-unstable
pkgver=9.0.0
pkgrel=1
pkgdesc="E926 API client (unstable build from GitHub)"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('klit')
conflicts=('klit')
options=('!strip')
source=("klit-unstable-${pkgver}.zip::https://github.com/openlyst/builds/releases/download/build-63/klit-9.0.0-2026-03-08-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    install -d "${pkgdir}/opt/klit"
    install -Dm755 "klit" "${pkgdir}/opt/klit/klit"
    install -d "${pkgdir}/opt/klit/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/klit/lib/"
    cp -r data "${pkgdir}/opt/klit/"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/klit.desktop" <<EOF
[Desktop Entry]
Name=Klit
Comment=E926 API client (unstable build from GitHub)
Exec=/opt/klit/klit
Icon=klit
Type=Application
Categories=Network;Graphics;
Keywords=e621;booru;privacy;;
EOF
    if [ -f "data/flutter_assets/assets/icons/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/klit.png"
    fi
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/klit/klit "${pkgdir}/usr/bin/klit"
}

