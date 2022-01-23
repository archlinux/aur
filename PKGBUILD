# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>

pkgname=cryptor
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple GUI application for gocryptfs"
arch=('x86_64' 'aarch64')
url="https://github.com/moson-mo/cryptor"
license=('BSD')
depends=('gtk3' 'libgee' 'glib2' 'json-glib')
makedepends=('vala' 'meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('102dfb9ee3eef59c116e7e90abd82bf343f3ee4badf42bbdf7b8deb6ed51140a')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  # binary and translations
  meson install -C build --destdir "$pkgdir"

  cd "$pkgname-$pkgver"

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # application file
  install -Dm644 "resources/misc/$pkgname.desktop" "$pkgdir/usr/share/applications/org.moson.$pkgname.desktop"
}
