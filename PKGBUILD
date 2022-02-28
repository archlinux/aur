# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=uresourced
pkgver=0.5.1
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
sha256sums=('d8e44989981f8682a5e323244630d81970e464448029a6182d7aac5bc0c1d110')

build() {
  arch-meson "$pkgname-v$pkgver" build -Dappmanagement='true'
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
