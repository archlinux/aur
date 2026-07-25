# Maintainer: OpenLyst <https://openlyst.ink>
# Version and download URL from Openlyst API: https://openlyst.ink/docs/api
pkgname=klit-bin
pkgver=10.2.0
pkgrel=1
pkgdesc="E926 API client"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('kilt')
conflicts=('kilt')
options=('!strip')
source=("klit-bin-${pkgver}.zip::https://github.com/openlyst/builds/releases/download/build-152/kilt-10.2.0-2026-07-24-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    install -d "${pkgdir}/opt/kilt"
    install -Dm755 "kilt" "${pkgdir}/opt/kilt/kilt"
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
    if [ -f "data/flutter_assets/assets/icons/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kilt.png"
    fi
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/kilt/kilt "${pkgdir}/usr/bin/kilt"
}

