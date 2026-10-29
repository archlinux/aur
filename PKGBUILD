# Maintainer: kirin@thekirin.net
# SPDX-License-Identifier: GPL-3.0-or-later

pkgname=wlib-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Modern Linux game manager for F95Zone"
arch=('x86_64')
url="https://github.com/kirin-3/wLib"
license=('GPL-3.0-or-later')
depends=(
  'ca-certificates'
  'python-cryptography'
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
  "${pkgname}-${pkgver}.tar.gz::https://github.com/kirin-3/wLib/releases/download/v0.4.3/wLib-v0.4.3-linux-x86_64.tar.gz"
)
sha256sums=('e0846c55a64412e2c24b98b58cddd65b1409088a66626957eeb4238ac0f3257a')

package() {
  install -dm755 "${pkgdir}/opt/wlib"
  cp -a "${srcdir}/wLib-v0.4.3-linux-x86_64/." "${pkgdir}/opt/wlib/"

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
