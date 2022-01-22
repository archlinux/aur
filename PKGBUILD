# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>

pkgname=cryptor
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple GUI application for gocryptfs"
arch=('x86_64' 'aarch64')
url="https://github.com/moson-mo/cryptor"
license=('BSD')
depends=('gtk3' 'libgee' 'glib2' 'json-glib')
makedepends=('vala' 'meson')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('afb0a2725b9a6a816da1385b756bc81822f612b065ad62a5086079e7f4898d2b')

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
