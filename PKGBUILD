# Maintainer: Bernhard Landauer <oberon@mnajaro.org>
# Co-Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: korrode <korrode at gmail>
# Contributor: sumt <sumt at sci dot fi>

pkgname=palemoon-bin
pkgver=28.9.0.2
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency."
arch=('i686' 'x86_64')
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
source=(palemoon.desktop)
source_x86_64=("https://linux.palemoon.org/datastore/release/palemoon-$pkgver.linux-x86_64.tar.xz"{,.sig})
source_i686=("https://linux.palemoon.org/datastore/release/palemoon-$pkgver.linux-i686.tar.xz"{,.sig})
# link to latest tarball: http://linux.palemoon.org/download/mainline/
sha256sums=('c6cae1c0de6b59da1d846cb2092ca2725ba2baa4d554223f747a4a71ee63002e')
sha256sums_i686=('38fab1f6e9e1fbd1b7d5eed2071661d3fb69418304b16ed66bc60ef6fdb98116'
                 'SKIP')
sha256sums_x86_64=('c66aa2a0d49d5eced6f95dcb2f029907791e7b26c3381747318cce0007fbc198'
                   'SKIP')

validpgpkeys=('439F46F42C6AE3D23CF52E70865E6C87C65285EC' # T. Wine
              '3DAD8CD107197488D2A2A0BD40481E7B8FCF9CEC') # Moonchild, see https://forum.palemoon.org/viewtopic.php?f=1&t=7176

package() {
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r palemoon/ "$pkgdir/usr/lib/palemoon"
  ln -s ../lib/palemoon/palemoon "$pkgdir/usr/bin/palemoon"
  install -Dm644 palemoon.desktop "$pkgdir/usr/share/applications/palemoon.desktop"

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
