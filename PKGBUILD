# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=uresourced
pkgver=0.4.0
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
sha256sums=('48420486f89e087bff2164bd61fd3165a85755f87cfe3e5924a42fd0dd574bbd')

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
