# Maintainer: OpenLyst <https://openlyst.ink>
# Version and download URL from Openlyst API: https://openlyst.ink/docs/api
pkgname=doudou-bin
pkgver=20.0.0
pkgrel=1
pkgdesc="Music player for self-hosted services"
arch=('x86_64')
url="https://openlyst.ink"
license=('GPL3')
depends=('gtk3')
optdepends=()
provides=('doudou')
conflicts=('doudou')
options=('!strip')
source=("doudou-bin-${pkgver}.zip::https://github.com/openlyst/builds/releases/download/build-124/doudou-20.0.0-2026-06-20-linux-x64.zip")
sha256sums=('SKIP')

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
Comment=Music player for self-hosted services
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

