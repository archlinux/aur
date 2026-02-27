# Maintainer: OpenLyst <https://openlyst.ink>
# Version and download URL from Openlyst API: https://openlyst.ink/docs/api
pkgname=finar-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Jellyfin frontend client"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('finar')
conflicts=('finar')
options=('!strip')
source=("finar-bin-${pkgver}.zip::https://gitlab.com/api/v4/projects/79691113/packages/generic/github-mirror/build-14/finar-1.1.0-2026-02-24-linux-x64.zip")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/bundle"

    install -d "${pkgdir}/opt/finar"
    install -Dm755 "finar" "${pkgdir}/opt/finar/finar"
    install -d "${pkgdir}/opt/finar/lib"
    install -Dm644 lib/*.so "${pkgdir}/opt/finar/lib/"
    cp -r data "${pkgdir}/opt/finar/"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/finar.desktop" <<EOF
[Desktop Entry]
Name=Finar
Comment=Jellyfin frontend client
Exec=/opt/finar/finar
Icon=finar
Type=Application
Categories=AudioVideo;Video;Player;
Keywords=jellyfin;media;video;streaming;;
EOF
    if [ -f "data/finar.png" ]; then
        install -Dm644 "data/finar.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/finar.png"
    fi
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/finar/finar "${pkgdir}/usr/bin/finar"
}

