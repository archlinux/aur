# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=uresourced
pkgver=0.5.2
pkgrel=1
pkgdesc="Dynamically allocate resources to the active user"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gitlab.freedesktop.org/benzea/uresourced"
license=('GPL')
depends=('glib2' 'pipewire' 'systemd')
makedepends=('meson')
backup=("etc/$pkgname.conf")
install="$pkgname.install"
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('9d9e0d082ac9e214d36968b4d44bfa06096f9bdc5f2d0cb169254b86b85503d2')

build() {
  arch-meson "$pkgname-v$pkgver" build -Dappmanagement='true'
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$pkgname-v$pkgver"
  install -Dm644 NEWS.md README -t "$pkgdir/usr/share/doc/$pkgname"
}
