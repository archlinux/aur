# Maintainer: OpenLyst <https://openlyst.ink>
# Unstable build from the app's GitLab nightly release: https://gitlab.com/Openlyst
pkgname=kilt-unstable
pkgver=12.0.0
pkgrel=1
pkgdesc="E926 API client (unstable build from GitHub)"
arch=('x86_64' 'aarch64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('kilt')
conflicts=('kilt')
options=('!strip')
source_x86_64=("kilt-unstable-${pkgver}-x86_64.zip::https://gitlab.com/Openlyst/klit/-/releases/nightly/downloads/kilt-linux-x64-12.0.0-2026-10-04.zip")
source_aarch64=("kilt-unstable-${pkgver}-aarch64.zip::https://gitlab.com/Openlyst/klit/-/releases/nightly/downloads/kilt-linux-arm64-12.0.0-2026-10-04.zip")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "${srcdir}/bundle"

    install -d "${pkgdir}/opt/kilt"
    install -Dm755 "klit" "${pkgdir}/opt/kilt/kilt"
    install -d "${pkgdir}/opt/kilt/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/kilt/lib/"
    cp -r data "${pkgdir}/opt/kilt/"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/kilt.desktop" <<EOF
[Desktop Entry]
Name=Kilt
Comment=E926 API client (unstable build from GitHub)
Exec=/opt/kilt/kilt
Icon=kilt
Type=Application
Categories=Network;Graphics;
Keywords=e621;booru;privacy;;
EOF
    if [ -f "data/flutter_assets/assets/icon/app/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icon/app/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kilt.png"
    fi
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/kilt/kilt "${pkgdir}/usr/bin/kilt"
}

