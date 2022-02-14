# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=uresourced
pkgver=0.4.1
pkgrel=1
pkgdesc="Dynamically allocate resources to the active user"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gitlab.freedesktop.org/benzea/uresourced"
license=('GPL')
depends=('glib2' 'systemd')
makedepends=('meson')
backup=("etc/$pkgname.conf")
install="$pkgname.install"
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('35b074e80f29c2e051826bc06c577570a3beb100fbc0ec23354bc2bc28dc7911')

build() {
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}

# No tests defined
#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$pkgname-v$pkgver"
  install -Dm644 NEWS.md README -t "$pkgdir/usr/share/doc/$pkgname"
}
