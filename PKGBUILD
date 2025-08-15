# Maintainer: Your Name <ekhuzadi@uci.edu>
pkgname=openbubbles-bin
pkgver=1.15.0+161
pkgrel=1
pkgdesc="Open-source iMessage client for Linux (precompiled binary)"
arch=('x86_64')
url="https://github.com/OpenBubbles/openbubbles-app"
license=('OBSD')
depends=(
  'gtk3'
  'libsecret'
  'libnotify'
  'libayatana-appindicator'
  'webkit2gtk-4.1'
  'mpv'
)
makedepends=('gendesk')
provides=('openbubbles')
conflicts=('openbubbles' 'openbubbles-git' 'bluebubbles-bin')
source=(
  "bluebubbles-linux-x86_64.tar::https://github.com/OpenBubbles/openbubbles-app/releases/download/v1.15.0%2B161/bluebubbles-linux-x86_64.tar"
  "openbubbles.sh"
)
sha256sums=(
  '969200295614ff83160863f2c59ee84d8d4ea758b62ee8b2ea4e12174b3675cb'
  'f272a09d70a6a5ef88d48d40089eca4f8b7737753681a0a908b2b21359339553'
)

prepare() {
  gendesk -f -n \
    --pkgname="openbubbles" \
    --pkgdesc="$pkgdesc" \
    --categories="Network;InstantMessaging" \
    --name="OpenBubbles" \
    --exec="openbubbles %U" \
    --icon="openbubbles"
}

package() {
  install -Dm755 "${srcdir}/openbubbles.sh" "${pkgdir}/usr/bin/openbubbles"
  install -Dm755 "${srcdir}/bluebubbles" "${pkgdir}/usr/lib/openbubbles/bluebubbles"
  cp -r "${srcdir}/data" "${pkgdir}/usr/lib/openbubbles/"
  cp -r "${srcdir}/lib" "${pkgdir}/usr/lib/openbubbles/"
  install -Dm644 "${srcdir}/data/flutter_assets/assets/icon/icon.png" \
    "${pkgdir}/usr/share/pixmaps/openbubbles.png"
  install -Dm644 "${srcdir}/openbubbles.desktop" \
    "${pkgdir}/usr/share/applications/openbubbles.desktop"
}
