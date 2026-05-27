# Maintainer: wisdom <wisboynelson123@gmail.com>

pkgname=termcanvas-bin
pkgver=0.39.8
pkgrel=1
pkgdesc="An infinite canvas desktop app for visually managing terminals"
arch=('x86_64')
url="https://github.com/blueberrycongee/termcanvas"
license=('MIT')
options=('!strip' '!debug')
depends=('fuse2' 'libxss' 'nss' 'gtk3' 'libnotify' 'xdg-utils' 'alsa-lib' 'libpulse')
provides=("termcanvas")
conflicts=("termcanvas")
source=("https://github.com/blueberrycongee/termcanvas/releases/download/v${pkgver}/TermCanvas-${pkgver}.AppImage"
        "termcanvas.desktop"
        "termcanvas.sh"
        "io.github.blueberrycongee.termcanvas.metainfo.xml")
sha256sums=('20fb1cb3ce75f552f73e06737ef61a927e49abdf502752e46e2ee8824686b490'
            'c6c906e40a33b914a678b3ea06d6363725299fda2486216652d5b3b48f86b930'
            'c8698fc7b6ce31d4179344ae25fd69453def4924d3c27957cdfb929d002ac608'
            '4520f8cdc107f7b3f7028c0e990ee370a2dc362f5d25d0e1804ab2bf703e9875')

package() {
  install -Dm755 "${srcdir}/TermCanvas-${pkgver}.AppImage" "${pkgdir}/opt/termcanvas/termcanvas"
  install -Dm644 "${srcdir}/termcanvas.desktop" "${pkgdir}/usr/share/applications/termcanvas.desktop"
  install -Dm644 "${srcdir}/io.github.blueberrycongee.termcanvas.metainfo.xml" \
    "${pkgdir}/usr/share/metainfo/io.github.blueberrycongee.termcanvas.metainfo.xml"
  install -Dm755 "${srcdir}/termcanvas.sh" "${pkgdir}/usr/bin/termcanvas"

  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  "${pkgdir}/opt/termcanvas/termcanvas" --appimage-extract termcanvas.png 2>/dev/null || true
  if [ -f squashfs-root/termcanvas.png ]; then
    install -Dm644 squashfs-root/termcanvas.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/termcanvas.png"
    rm -rf squashfs-root
  fi
}
