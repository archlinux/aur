# Maintainer: OpenLyst <https://openlyst.ink>
# Version and download URL from Openlyst API: https://openlyst.ink/docs/api
pkgname=klit-bin
pkgver=9.0.0
pkgrel=1
pkgdesc="E926 API client"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('klit')
conflicts=('klit')
options=('!strip')
source=("klit-bin-${pkgver}.zip::https://gitlab.com/api/v4/projects/79691113/packages/generic/github-mirror/build-68/klit-9.0.0-2026-03-09-linux-x64.zip")
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
Comment=E926 API client
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

