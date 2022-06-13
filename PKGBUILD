# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=uresourced
pkgver=0.5.3
pkgrel=1
pkgdesc="Dynamically allocate resources to the active user"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gitlab.freedesktop.org/benzea/uresourced"
license=('GPL')
depends=('glib2' 'systemd-libs')
makedepends=('meson' 'pipewire')
optdepends=('pipewire')
backup=("etc/$pkgname.conf")
install="$pkgname.install"
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('a765c295e4fca2309178f56519c20b164b49bd2583c727fbf9d4e6f61b5212a5')

build() {
  arch-meson "$pkgname-v$pkgver" build -Dappmanagement='true'
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "$pkgname-v$pkgver"
  install -Dm644 NEWS.md README -t "$pkgdir/usr/share/doc/$pkgname"
}
