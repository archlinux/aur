# Maintainer: OpenLyst <https://openlyst.ink>
# Unstable build from the app's GitLab nightly release: https://gitlab.com/Openlyst
pkgname=doudou-unstable
pkgver=23.0.0
pkgrel=1
pkgdesc="The final music player (unstable build from GitHub)"
arch=('x86_64' 'aarch64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('doudou')
conflicts=('doudou')
options=('!strip')
source_x86_64=("doudou-unstable-${pkgver}-x86_64.zip::https://gitlab.com/Openlyst/doudou/-/releases/nightly/downloads/doudou-linux-x64-23.0.0-2026-10-04.zip")
source_aarch64=("doudou-unstable-${pkgver}-aarch64.zip::https://gitlab.com/Openlyst/doudou/-/releases/nightly/downloads/doudou-linux-arm64-23.0.0-2026-10-04.zip")
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
Comment=The final music player (unstable build from GitHub)
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

