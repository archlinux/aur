# Maintainer: TheRealOwenJ <troj@newo.live>

pkgname=itchio-bin
pkgver=26.15.0
pkgrel=1
pkgdesc="The official desktop app for itch.io"
arch=('x86_64')
url="https://itch.io/app"
license=('MIT')
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
    'SKIP'
)

package() {
    install -dm755 "${pkgdir}/opt/itch"

    tar -xf "${srcdir}/itch-${pkgver}.tar.gz" \
        --strip-components=1 \
        -C "${pkgdir}/opt/itch"

    install -dm755 "${pkgdir}/usr/bin"

    ln -s "/opt/itch/itch" \
        "${pkgdir}/usr/bin/itch"

    install -Dm644 \
        "${pkgdir}/opt/itch/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/itch.png"

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
MimeType=x-scheme-handler/itchio;x-scheme-handler/itch;
EOF
}
