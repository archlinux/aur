# Maintainer: 12tae12 <https://aur.archlinux.org/account/12tae12>
pkgname=cadoodle-bin
pkgver=1.9.010
pkgrel=1
pkgdesc="Simple drag-and-drop CAD tool, local TinkerCAD alternative (AppImage)"
arch=('x86_64')
url="https://cadoodlecad.com"
license=('CC0-1.0')
depends=('fuse2' 'hicolor-icon-theme' 'zlib')
options=('!strip' '!debug')
provides=('cadoodle')
conflicts=('cadoodle')

source=(
    "cadoodle-${pkgver}.AppImage::https://github.com/CommonWealthRobotics/CaDoodle/releases/download/${pkgver}/CaDoodle-Linux-${CARCH}.AppImage"
    "cadoodle.png::https://github.com/CommonWealthRobotics/CaDoodle/blob/main/SourceIcon.png?raw=true"
)
sha256sums=(
    '33f7520cd94cb9b1984e9864615f86ffff8626df639e6716b7f0fc9a6d8678c3'
    '0cbecec683a9c1dbd609e6468e47a3f2e67c5825e514afe30976a111cd212348'
)

package() {
    install -Dm755 "${srcdir}/cadoodle-${pkgver}.AppImage" \
        "${pkgdir}/opt/cadoodle/cadoodle.AppImage"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/cadoodle/cadoodle.AppImage "${pkgdir}/usr/bin/cadoodle"

    install -Dm644 "${srcdir}/cadoodle.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cadoodle.png"

    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/applications/cadoodle.desktop" <<EOF
[Desktop Entry]
Name=CaDoodle
GenericName=CAD Editor
Comment=Simple drag-and-drop CAD tool
Exec=/opt/cadoodle/cadoodle.AppImage %F
Icon=cadoodle
Terminal=false
Type=Application
Categories=Graphics;3DGraphics;Engineering;
Keywords=CAD;3D;modeling;TinkerCAD;
StartupNotify=true
EOF
}
