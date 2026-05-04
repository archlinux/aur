# Maintainer: aur.chaotic.cx
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: korrode <korrode at gmail>
# Contributor: sumt <sumt at sci dot fi>

_pkgname="palemoon"
pkgname="$_pkgname-gtk3-bin"
epoch=1
pkgver=34.2.2
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency"
url="https://www.palemoon.org/"
license=('MPL-2.0')
arch=('x86_64')

depends=(
  'alsa-lib'
  'dbus-glib'
  'gtk3'
  'hicolor-icon-theme'
  'libxt'
  'mime-types'
  'nss'
)
optdepends=(
  'ffmpeg: record, convert, and stream audio and video'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!strip')

source=(
  "palemoon-$pkgver.desktop"::"https://repo.palemoon.org/MoonchildProductions/Pale-Moon/raw/tag/${pkgver}_Release/palemoon/branding/official/palemoon.desktop"
  "https://rm-eu.palemoon.org/release/palemoon-${pkgver}.linux-x86_64-gtk3.tar.xz"{,.sig}
)
sha256sums=(
  'b3803b30b5e6b9589387b7162cd24247da242fe77c0aed0d09bc51338d36d7d8'
  '5760cf61473b3223d64eb740925022a17e4016675fe86d2d3c2696e5127e1ec0'
  'SKIP'
)
validpgpkeys=(
  '439F46F42C6AE3D23CF52E70865E6C87C65285EC' # T. Wine
  '3DAD8CD107197488D2A2A0BD40481E7B8FCF9CEC' # Moonchild, see https://forum.palemoon.org/viewtopic.php?f=1&t=7176
)

package() {
  mkdir -pm755 "$pkgdir"/usr/{bin,lib}
  cp -r palemoon/ "$pkgdir/usr/lib/palemoon"
  ln -s ../lib/palemoon/palemoon "$pkgdir/usr/bin/palemoon"

  install -Dm644 "palemoon-$pkgver.desktop" "$pkgdir/usr/share/applications/palemoon.desktop"

  local _hicolor="$pkgdir/usr/share/icons/hicolor"
  install -Dm644 palemoon/browser/chrome/icons/default/default16.png "$_hicolor/16x16/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default32.png "$_hicolor/32x32/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default48.png "$_hicolor/48x48/apps/palemoon.png"
  install -Dm644 palemoon/browser/icons/mozicon128.png "$_hicolor/128x128/apps/palemoon.png"
}
