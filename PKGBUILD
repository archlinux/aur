# Maintainer: OpenLyst <https://openlyst.ink>
# Download URL from the app's GitLab release: https://gitlab.com/Openlyst
pkgname=doudou-bin
pkgver=22.0.0
pkgrel=1
pkgdesc="The final music player"
arch=('x86_64' 'aarch64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('doudou')
conflicts=('doudou')
options=('!strip')
source_x86_64=("doudou-bin-${pkgver}-x86_64.zip::https://gitlab.com/Openlyst/doudou/-/releases/v22.0.0/downloads/doudou-linux-x64-22.0.0-2026-09-13.zip")
source_aarch64=("doudou-bin-${pkgver}-aarch64.zip::https://gitlab.com/Openlyst/doudou/-/releases/v22.0.0/downloads/doudou-linux-arm64-22.0.0-2026-09-13.zip")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    cd "${srcdir}/bundle"

    install -d "${pkgdir}/opt/doudou"
    install -Dm755 "doudou" "${pkgdir}/opt/doudou/doudou"
    install -d "${pkgdir}/opt/doudou/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/doudou/lib/"
    cp -r data "${pkgdir}/opt/doudou/"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/doudou.desktop" <<EOF
[Desktop Entry]
Name=Doudou
Comment=The final music player
Exec=/opt/doudou/doudou
Icon=doudou
Type=Application
Categories=Audio;Music;Player;
Keywords=music;streaming;audio;player;;
EOF
    if [ -f "data/flutter_assets/assets/icons/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/doudou.png"
    fi
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/doudou/doudou "${pkgdir}/usr/bin/doudou"
}

