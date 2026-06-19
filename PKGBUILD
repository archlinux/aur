# Maintainer: Ishan Parihar <ishanp at protonmail dot com>
pkgname=neverwrite-bin
pkgver=0.3.5
pkgrel=2
pkgdesc='The bastard son between Cursor and Obsidian - local-first knowledge workspace with AI'
arch=('x86_64')
url='https://neverwrite.app/'
license=('Apache-2.0')
depends=('fuse2' 'squashfuse' 'glib2' 'libnotify' 'libxtst' 'nss' 'libxss' 'gtk3' 'mesa')
optdepends=('libappindicator-gtk3: Tray icon support')
options=('!strip')
source=("https://github.com/jsgrrchg/NeverWrite/releases/download/v${pkgver}/NeverWrite-${pkgver}-x64.AppImage"
        "neverwrite.desktop"
        "neverwrite.png")
sha256sums=('57c030fe6bbfa9b8f886274e2a03a456562618aa3fd28d4a1a11479cf49fc668'
            '60e38a4b29806b1ab79b3db9afb90a4d27dadf89cff0311b3cf48bc900be4bcc'
            '6f201da8de1e9c712ef751a88470d4f83a5baf2b111329b0c589fb4a892a508f')

prepare() {
    chmod +x "NeverWrite-${pkgver}-x64.AppImage"
}

package() {
    # Install the AppImage
    install -Dm755 "NeverWrite-${pkgver}-x64.AppImage" "${pkgdir}/opt/neverwrite/NeverWrite-${pkgver}.AppImage"

    # Create wrapper script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/neverwrite" <<EOF
#!/bin/sh
exec /opt/neverwrite/NeverWrite-${pkgver}.AppImage "\$@"
EOF

    # Install desktop file
    install -Dm644 "neverwrite.desktop" "${pkgdir}/usr/share/applications/neverwrite.desktop"

    # Install icon
    install -Dm644 "neverwrite.png" "${pkgdir}/usr/share/pixmaps/neverwrite.png"
}
