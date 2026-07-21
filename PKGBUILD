# Maintainer: TheRealOwenJ <troj@newo.live>

pkgname=itchio-bin
pkgver=26.15.0
pkgrel=1
pkgdesc="The official desktop app for itch.io"
arch=('x86_64')
url="https://itch.io/app"
license=('MIT')
provides=('itchio')
conflicts=('itchio')
depends=(
    'alsa-lib'
    'gtk3'
    'libxss'
    'libxtst'
    'nss'
    'xdg-utils'
)
options=('!strip')

source=(
    "itch-${pkgver}.tar.gz::https://broth.itch.zone/itch/linux-amd64/${pkgver}/archive/default"
)

sha256sums=(
    'c5bc21f9584bb7802d5875ca5244483dae5360efbc6e39677b0bf497d2df8b10'
)

package() {
    install -dm755 "${pkgdir}/opt/itch"

    cp -a "${srcdir}"/* "${pkgdir}/opt/itch/"

    install -dm755 "${pkgdir}/usr/bin"

    ln -s "/opt/itch/itch" \
        "${pkgdir}/usr/bin/itch"

    install -Dm644 \
        "${srcdir}/resources/app/src/static/images/window/itch/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/itch.png"

    install -Dm644 \
        "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/itch.desktop" <<EOF
[Desktop Entry]
Name=itch.io
Comment=The official desktop app for itch.io
Exec=itch %U
Icon=itch
Terminal=false
Type=Application
Categories=Game;
StartupWMClass=itch
EOF
}