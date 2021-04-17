# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: poisonby <poisonby@tutanota.com>
# Contributor: Jason Scurtu (scujas) <jscurtu@gmail.com>
# Contributor: Marcin Tydelski <marcin.tydelski@gmail.com>
# Contributor: Jan Lukas Gernert (JeanLuc) <https://launchpad.net/~eviltwin1>

pkgname=feedreader
_pkgname=FeedReader
pkgver=2.11.0
pkgrel=1
pkgdesc='Modern desktop application designed to complement existing web-based RSS accounts'
arch=('x86_64')
url='https://jangernert.github.io/FeedReader/'
license=('GPL3')
depends=('curl' 'org.freedesktop.secrets' 'gnome-online-accounts' 'gumbo-parser' 'libgee' 'libpeas')
makedepends=('gobject-introspection' 'meson' 'vala')
source=("https://github.com/jangernert/FeedReader/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9f679cc08e5673e9e90541b0a0c4066990deacddfe2692f6611799d99bdf5b3e')

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
