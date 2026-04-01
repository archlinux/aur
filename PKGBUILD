# Maintainer: 12tae12 <https://aur.archlinux.org/account/12tae12>
pkgname=cadoodle-bin
pkgver=1.4.3
pkgrel=1
pkgdesc="Simple drag-and-drop CAD tool, local TinkerCAD alternative (AppImage)"
arch=('x86_64')
url="https://cadoodlecad.com"
license=('CC0-1.0')
depends=('fuse2' 'hicolor-icon-theme')
options=('!strip')
provides=('cadoodle')
conflicts=('cadoodle')

source=("cadoodle-${pkgver}.AppImage::https://github.com/CommonWealthRobotics/CaDoodle/releases/download/${pkgver}/CaDoodle-Linux-x86_64.AppImage"
        "cadoodle.png::https://github.com/CommonWealthRobotics/CaDoodle/blob/main/SourceIcon.png?raw=true")
sha256sums=('SKIP'
            'd88745a3b7269d255109c46ba1b5146ebc4c38b8e20ba5afa15400da4db46e9f')

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
