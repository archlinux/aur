# Maintainer: OpenLyst <https://openlyst.ink>
# Version and download URL from Openlyst API: https://openlyst.ink/docs/api
pkgname=docan-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="AI chat app with Liquid Glass UI"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('docan')
conflicts=('docan')
options=('!strip')
source=("docan-bin-${pkgver}.zip::https://github.com/justacalico/Openlyst-more-builds/releases/download/build-1/docan-3.0.0-2026-02-08-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"

    install -d "${pkgdir}/opt/docan"
    install -Dm755 "docan" "${pkgdir}/opt/docan/docan"
    install -d "${pkgdir}/opt/docan/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/docan/lib/"
    cp -r data "${pkgdir}/opt/docan/"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/docan.desktop" <<EOF
[Desktop Entry]
Name=Docan
Comment=AI chat app with Liquid Glass UI
Exec=/opt/docan/docan
Icon=docan
Type=Application
Categories=Network;Chat;Utility;
Keywords=ai;chat;assistant;llm;;
EOF
    if [ -f "data/flutter_assets/assets/icons/icon.png" ]; then
        install -Dm644 "data/flutter_assets/assets/icons/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/docan.png"
    fi
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/docan/docan "${pkgdir}/usr/bin/docan"
}

