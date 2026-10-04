# Maintainer: OpenLyst <https://openlyst.ink>
# Download URL from the app's GitLab release: https://gitlab.com/Openlyst
pkgname=kilt-bin
pkgver=11.0.0
pkgrel=1
pkgdesc="E926 API client"
arch=('x86_64' 'aarch64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('kilt')
conflicts=('kilt')
options=('!strip')
source_x86_64=("kilt-bin-${pkgver}-x86_64.zip::https://gitlab.com/Openlyst/klit/-/releases/v11.0.0/downloads/kilt-linux-x64-11.0.0-2026-08-27.zip")
source_aarch64=("kilt-bin-${pkgver}-aarch64.zip::https://gitlab.com/Openlyst/klit/-/releases/v11.0.0/downloads/kilt-linux-arm64-11.0.0-2026-08-27.zip")
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
Comment=E926 API client
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

