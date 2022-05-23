# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>

_mesonver=$(meson --version)
pkgname=cryptor
pkgver=1.0.2
pkgrel=1
pkgdesc="Simple GUI application for gocryptfs"
arch=('x86_64' 'aarch64')
url="https://github.com/moson-mo/cryptor"
license=('BSD')
depends=('gtk3' 'libgee' 'glib2' 'json-glib')
makedepends=('vala' 'meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9fdd757db68a8551dbf0dc4aef41981c8396eaaa45236ad66f4b6e38795e4391')

build() {
  arch-meson "$pkgname-$pkgver" build-$_mesonver
  meson compile -C build-$_mesonver
}

package() {
  # binary and translations
  meson install -C build-$_mesonver --destdir "$pkgdir"

  cd "$pkgname-$pkgver"

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # application file
  install -Dm644 "resources/misc/$pkgname.desktop" "$pkgdir/usr/share/applications/org.moson.$pkgname.desktop"
}
