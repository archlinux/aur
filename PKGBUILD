# Maintainer: kirin@thekirin.net
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=wlib-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Modern Linux game manager for F95Zone"
arch=('x86_64')
url="https://github.com/kirin-3/wLib"
license=('GPL-3.0-or-later')
depends=(
  'ca-certificates'
  'gtk3'
  'hicolor-icon-theme'
  'libxkbcommon-x11'
  'mesa-utils'
  'wine'
  'winetricks'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
)
optdepends=(
  'firefox: Firefox extension support'
  'chromium: Chromium extension support'
  'proton-ge-custom-bin: Proton-GE runtime support'
)
provides=('wlib')
conflicts=('wlib')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kirin-3/wLib/releases/download/v0.3.6/wLib-v0.3.6-linux-x86_64.tar.gz"
)
sha256sums=('b5029f95b14cc101c293e9757ed648bff944eeaefb84e5999846bf50e2accadb')

package() {
  install -dm755 "${pkgdir}/opt/wlib"
  cp -a "${srcdir}/wLib-v0.3.6-linux-x86_64/." "${pkgdir}/opt/wlib/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/wlib/wlib "${pkgdir}/usr/bin/wlib"

  install -Dm644 "${pkgdir}/opt/wlib/wlib.desktop" \
    "${pkgdir}/usr/share/applications/wlib.desktop"

  install -Dm644 "${pkgdir}/opt/wlib/icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wlib.svg"

  install -Dm644 "${pkgdir}/opt/wlib/wlib.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/wlib.png"

  install -Dm644 "${pkgdir}/opt/wlib/wlib.png" \
    "${pkgdir}/usr/share/pixmaps/wlib.png"

  install -Dm644 "${pkgdir}/opt/wlib/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
