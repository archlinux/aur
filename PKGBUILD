# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: korrode <korrode at gmail>
# Contributor: sumt <sumt at sci dot fi>

pkgname=palemoon-bin
epoch=1
pkgver=33.9.0.1
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency."
arch=('x86_64')
url="http://linux.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib'
    'dbus-glib'
    'desktop-file-utils'
    'gtk2'
    'libxt'
    'mime-types'
    'nss')
optdepends=('ffmpeg: record, convert, and stream audio and video')
provides=("palemoon=$pkgver")
conflicts=('palemoon')
options=('!strip')
source=(palemoon.desktop-${pkgver}::"https://repo.palemoon.org/MoonchildProductions/Pale-Moon/raw/tag/${pkgver}_Release/palemoon/branding/official/palemoon.desktop"
       "https://rm-eu.palemoon.org/release/palemoon-${pkgver}.linux-x86_64-gtk2.tar.xz"{,.sig}) # EU link
#      "https://rm-us.palemoon.org/release/palemoon-${pkgver}.linux-x86_64-gtk2.tar.xz"{,.sig}) # US link
# link to latest tarball: https://www.palemoon.org/download.shtml
sha256sums=('b3803b30b5e6b9589387b7162cd24247da242fe77c0aed0d09bc51338d36d7d8'
            '949cbc8577775f313b1e618c577ed1153454660f360bf188a605b50cc649a3df'
            'SKIP')
validpgpkeys=('439F46F42C6AE3D23CF52E70865E6C87C65285EC' # T. Wine
              '3DAD8CD107197488D2A2A0BD40481E7B8FCF9CEC') # Moonchild, see https://forum.palemoon.org/viewtopic.php?f=1&t=7176

package() {
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r palemoon/ "$pkgdir/usr/lib/palemoon"
  ln -s ../lib/palemoon/palemoon "$pkgdir/usr/bin/palemoon"
  install -Dm644 palemoon.desktop-$pkgver "$pkgdir/usr/share/applications/palemoon.desktop"

  # icons
  install -Dm644 palemoon/browser/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/palemoon.png"
  install -Dm644 palemoon/browser/icons/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/palemoon.png"
}
