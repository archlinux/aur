# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=embellish
pkgver=1.2.0
pkgrel=1
pkgdesc="Install Nerd Fonts"
arch=('x86_64')
url="https://github.com/getnf/embellish"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'gtksourceview5'
  'json-glib'
  'libadwaita'
  'libarchive'
  'libgee'
  'libsoup3'
)
makedepends=(
  'blueprint-compiler'
  'meson'
  'vala'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e6250047aea8974a262c778bb09dd5cc3c83268ef168f006cfc3473028dcfa51')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
