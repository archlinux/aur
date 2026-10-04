# Maintainer: OpenLyst <https://openlyst.ink>
# Deprecated - use kilt-bin instead. Kept so existing installs still build.
pkgname=klit-bin
pkgver=11.0.0
pkgrel=2
pkgdesc="Deprecated - install kilt-bin instead"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('kilt')
conflicts=('kilt')
options=('!strip')
install=klit-bin.install
source=("klit-bin-${pkgver}.zip::https://gitlab.com/Openlyst/klit/-/releases/v11.0.0/downloads/kilt-linux-x64-11.0.0-2026-08-27.zip")
sha256sums=('SKIP')

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

