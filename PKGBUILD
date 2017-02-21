# Maintainer: sumt <sumt at sci dot fi>
pkgname=palemoon-bin
pkgver=27.1.1
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency."
arch=('i686' 'x86_64')
url="http://linux.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('gtk2' 'dbus-glib' 'libxt' 'mime-types' 'nss' 'alsa-lib')
optdepends=('palemoon-i18n-default: language pack for system active language'
            'hunspell: spell checker and morphological analyzer'
            'hyphen: library for hyphenation and justification'
            'ffmpeg: record, convert, and stream audio and video')
provides=("palemoon=$pkgver")
conflicts=('palemoon')
options=('!strip')
source=(palemoon.desktop)
source_i686=("palemoon-$pkgver.en-US.linux-i686.tar.bz2::http://linux.palemoon.org/installer/download.php?v=$pkgver&a=i686")
source_x86_64=("palemoon-$pkgver.en-US.linux-x86_64.tar.bz2::http://linux.palemoon.org/installer/download.php?v=$pkgver&a=x86_64")
sha256sums=('c6cae1c0de6b59da1d846cb2092ca2725ba2baa4d554223f747a4a71ee63002e')
sha256sums_i686=('5fdf766e9b0f6645613189fbc50cb0530697feff0f7912dc312efb7aa2550280')
sha256sums_x86_64=('1311d06fac2ebdbd30db01f8f44a007d4f67eecf49977117976b1b6837d461b4')

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

  # use system-provided dictionaries
  rm -rf "$pkgdir"/usr/lib/palemoon/{dictionaries,hyphenation}
  ln -s /usr/share/hunspell "$pkgdir/usr/lib/palemoon/dictionaries"
  ln -s /usr/share/hyphen "$pkgdir/usr/lib/palemoon/hyphenation"

  # avoid duplicate binaries
  # https://bugzilla.mozilla.org/show_bug.cgi?id=658850
  ln -sf palemoon "$pkgdir/usr/lib/palemoon/palemoon-bin"
}
