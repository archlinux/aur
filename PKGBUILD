# Maintainer: OpenLyst <https://openlyst.ink>
# Unstable build from GitHub releases: https://github.com/openlyst/builds/releases
pkgname=docan-unstable
pkgver=3.0.0
pkgrel=1
pkgdesc="Chat app with Liquid Glass UI (unstable build from GitHub)"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('docan')
conflicts=('docan')
options=('!strip')
source=("docan-unstable-${pkgver}.zip::https://gitlab.com/api/v4/projects/79691113/packages/generic/github-mirror/build-4/docan-3.0.0-2026-02-08-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    install -d "${pkgdir}/opt/docan"
    install -Dm755 "docan" "${pkgdir}/opt/docan/docan"
    install -d "${pkgdir}/opt/docan/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/docan/lib/"
    cp -r data "${pkgdir}/opt/docan/"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/docan.desktop" <<EOF
[Desktop Entry]
Name=Docan
Comment=Chat app with Liquid Glass UI (unstable build from GitHub)
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

