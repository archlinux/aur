# Maintainer: João Gabriel V. Melão <jgvasconcellos22@gmail.com>

pkgname=silex-desktop-v3-bin
pkgver=3.10.0canary4 # I'll switch to stable once ready 
_pkgver=3.10.0-canary.4
pkgrel=1
pkgdesc="Silex website builder desktop application"
arch=('x86_64')
url="https://github.com/silexlabs/Silex"
license=('AGPL-3.0-or-later')

options=('!strip' '!debug')

depends=(
    gtk3
    webkit2gtk-4.1
)

_raw="https://raw.githubusercontent.com/silexlabs/Silex/v${_pkgver}"

source=(
    "silex-desktop-${_pkgver}::${url}/releases/download/v${_pkgver}/silex-desktop"
    "silex-desktop-${_pkgver}-32.png::${_raw}/desktop/src-tauri/icons/32x32.png"
    "silex-desktop-${_pkgver}-128.png::${_raw}/desktop/src-tauri/icons/128x128.png"
    "silex-desktop-${_pkgver}-256.png::${_raw}/desktop/src-tauri/icons/128x128@2x.png"
)
sha256sums=('13f4324b04840753b9ad2d992c02d2610d00ab1da6e78ff5aaa860f0526b5a5d' # Update every release
            '989a7245ae9e7c4e88c6c3213e14b8b75f292e1075f105991c7076cdfda3487d'
            'a657b1fb4c4bcd261346772be2c1b779f7c85f62adbdd5cc1387b34280273739'
            'e4c825dcf606944b693354d819d7e3ee861d97c80cb0cf40612b8e40f1a996e6')

package() {
    cd "$srcdir"

    install -Dm755 "silex-desktop-${_pkgver}" \
        "$pkgdir/usr/bin/silex-desktop"

    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/silex-desktop.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Silex
Comment=Silex website builder - desktop app
Exec=silex-desktop
Icon=silex-desktop
Terminal=false
Categories=Development;
StartupWMClass=silex-desktop
EOF

    install -Dm644 "silex-desktop-${_pkgver}-32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/silex-desktop.png"
    install -Dm644 "silex-desktop-${_pkgver}-128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/silex-desktop.png"
    install -Dm644 "silex-desktop-${_pkgver}-256.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/silex-desktop.png"
}

